# Main libraries for data
import pandas as pd
import numpy as np
import os
import sys
from datetime import datetime

# Libraries for the recommendation model
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.utils import shuffle

# Libraries for the webscraper
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC

# Libraries for the connection with DB
import psycopg2

class Recommendation_Algorithm():

    def __init__(self):
        # Initializing empty data frames, inputing the data base access configuration
        # and connecting to that DB

        self.recipes_raw = pd.DataFrame()
        self.recipes = pd.DataFrame()
        self.users = pd.DataFrame()
        self.similarity_matrix = None

        self.configurations = {
        'user': 'gazcuunctivuns',
        'password': '9c811cafb7a006fe7802c6016466fcb7a4e7fe8585651ba90d3a3a21f9f4f0bb',
        'host': 'ec2-3-89-0-52.compute-1.amazonaws.com',
        'port': 5432,
        'database': 'd9v8ohbufnektr'
        }

        self.connect_to_db()

    # Recommendation model algorithm
    def initialize_model(self):
        # This method initializes the recommendation model by creating a matrix containing in the
        # cell i, j the simmilarity between the ith and jth recipes in the self.recipes dataframe.

        # This matrix is the stored as an numpy array on the self.similarity_matrix attribute.

        # This data frame is supposed to be loaded  by the initialize_tables method

        # The similarity is calculated using sklearn's cossine similarity with the features/words in the "soup" column

        # The soup column aggregates information from a recipe category (breakfast, desert, ...), cuisine and keywords

        # Creating counting matrix (counts all features)
        count_matrix = CountVectorizer(stop_words='english').fit_transform(self.recipes['soup'])

        # Create cosine similarity matrix
        cosine_sim = cosine_similarity(count_matrix, count_matrix)

        # To numpy array
        self.similarity_matrix = np.array(cosine_sim)

    def sort_recommended_recipes(self, user_id, users_table="user_classifications"):
        # This is the main method of this class. It sorts the recommended recipes for a given user.

        # The user retrieved from the Data Base "user_classifications" table using the given user_id.

        # All the recipes classifications are retrieved from the "user_recommendations" table, which contains
        # classifications 0(dislike), 1(like) and 2(love) for each recipe.

        # This scores are used to multiply and filter the similarity matrix calculated in the initialize_model method
        # to create a score vector.

        # The score vector contains the scores for each recipe for a given user. Sorting this vector yields us the ids of the
        # recommended recipes.

        # Some id translation is necessary because the similarity matrix operates with indexes
        # from 0 to the number of recipes considered and the recipes table in the data base contains recipes
        # that are not to be considered in this program. Hence the ids are all different.

        # After this recommendation is calculated, the list of recipes ids is transformed into a list and
        # inserted into the "user_recommendations" in the data base. If a user already has a recommendation list,
        # this list is updated.

        ## Fetching table from db
        cursor = self.connection.cursor()

        # Getting users table
        self.initialize_tables(users_table_name=users_table)

        # Making a copy of users
        users = self.users

        # Getting positive and negative reviews from user (with respect to the recipe_id)
        users = users[users['user_id']==user_id].drop(columns=['user_id', 'id', 'created_at', 'updated_at'])
        dislike_indexes = list(users[users['classification']==0]['recipe_id'])
        like_indexes = list(users[users['classification']==1]['recipe_id'])
        love_indexes = list(users[users['classification']==2]['recipe_id'])


        # Converting those lists to positional id (accounting only bbc recipes)
        like_indexes = [int(self.recipes[self.recipes["id"]==index].index[0]) for index in like_indexes]
        dislike_indexes = [int(self.recipes[self.recipes["id"]==index].index[0]) for index in dislike_indexes]
        love_indexes = [int(self.recipes[self.recipes["id"]==index].index[0]) for index in love_indexes]
        classified_indexes = like_indexes + dislike_indexes

        # making copy of similarity matrix
        similarity_matrix = self.similarity_matrix

        # Flipping sign of negative reviews
        similarity_matrix[:,dislike_indexes] = -similarity_matrix[:,dislike_indexes]

        # Doubling "love" reviews
        similarity_matrix[:,love_indexes] = 2 * similarity_matrix[:, love_indexes]

        # Reducing matrix given user evaluated recipes
        similarity_matrix = similarity_matrix[:, classified_indexes]

        # Creating score vector for given recipes
        score_vector = similarity_matrix.sum(axis=1)

        # Getting indexes that sort score array
        sorted_indexes = list(np.argsort(score_vector))[::-1]
        sorted_indexes = [int(index) for index in sorted_indexes]
        sorted_indexes = [int(self.recipes.at[index, "id"]) for index in sorted_indexes]
        sorted_indexes_string = str(sorted_indexes)
        sorted_indexes_string = sorted_indexes_string.replace("[", "{").replace("]", "}")

        # Applying changes to db
        table_name = 'user_recommendations'
        sql = f"SELECT user_id FROM {table_name}"
        cursor.execute(sql)
        users_list = [element for element, in cursor.fetchall()]
        next_id = len(users_list)

        if user_id in users_list:
            sql = f"UPDATE {table_name}"
            sql += f" SET recipe_list = '{sorted_indexes_string}'"
            sql += f" WHERE user_id = {user_id}"
        else:
            sql = f"INSERT INTO {table_name} VALUES "
            sql += f"({next_id}, {user_id}, ' {sorted_indexes_string} ', '{str(datetime.now())}', '{str(datetime.now())}')"

        cursor.execute(sql)
        self.connection.commit()

    # Data managing methods
    def initialize_tables(self, recipe_raw_path=None, users_path=None, recipes_path=None, recipe_table_name=None, users_table_name=None):
        # This method simply initializes tables inside our recommendation model.

        # It can load different tables:
        # - recipes_raw: the raw recipes data from the bbc. This table is used as the basis for the creation of the
        #     cleaned recipes table
        # - recipes: the cleaned recipes table with only important columns
        # - users: the users classifications table locally. Used mainly for development/debugging

        # If a path is given the table is loaded from the local directory either from csv or from json formats.
        # If the table name is given, the table will be retrieved from the data base

        if not recipe_raw_path == None:
            if recipe_raw_path.endswith('.csv'):
                self.recipes_raw = pd.read_csv(recipe_raw_path)
            if recipe_raw_path.endswith('.json'):
                self.recipes_raw = pd.read_json(recipe_raw_path)

        if not users_path == None:
            if users_path.endswith('.csv'):
                self.users = pd.read_csv(users_path)
            if users_path.endswith('.json'):
                self.users = pd.read_json(users_path)

        if not recipes_path == None:
            if recipes_path.endswith('.csv'):
                self.recipes = pd.read_csv(recipes_path)
            if recipes_path.endswith('.json'):
                self.recipes = pd.read_json(recipes_path)

        if not recipe_table_name == None:
            cursor = self.connection.cursor()
            # Getting column names
            sql = f"SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{recipe_table_name}';"
            cursor.execute(sql)
            columns = [element for element, in cursor.fetchall()]

            # Getting the actual table
            sql = f"SELECT * FROM {recipe_table_name}"
            cursor.execute(sql)
            self.recipes = pd.DataFrame(cursor.fetchall(), columns=columns)
            self.recipes = self.recipes[self.recipes['bbc']==True].reset_index(drop=True)
            self.connection.commit()

        if not users_table_name == None:
            cursor = self.connection.cursor()

            # Getting column names
            sql = f"SELECT column_name FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '{users_table_name}';"
            cursor.execute(sql)
            columns = [element for element, in cursor.fetchall()]

            # Getting the actual table
            sql = f"SELECT * FROM {users_table_name}"
            cursor.execute(sql)
            self.users = pd.DataFrame(cursor.fetchall(), columns=columns)
            self.connection.commit()

    def get_image_links(self):
        # Simple webscraper script used for retrieving the recipe images link, written with the selenium framework.

        # It uses chrome to access the bbc foods link and the copies the image link from the html.

        # Importing chrome driver
        driver_path = os.path.join(os.getcwd(), 'chromedriver')
        driver = webdriver.Chrome(driver_path)

        # main loop
        image_links = []

        try:
            for index in range(self.recipes.shape[0]):
                try:
                    # Accessing recipe url
                    url = self.recipes.at[index, 'recipeLink']
                    driver.get(url)

                    # Finding media box
                    media = WebDriverWait(driver, 10).until(
                        EC.presence_of_element_located((By.CLASS_NAME, "recipe-media"))
                        )

                    # getting image tag and appending to list
                    images = media.find_elements_by_tag_name("img")
                    image = images[0]
                    image_links.append(image.get_attribute("src"))

                except:
                    # Appending nothing to recipes without image
                    image_links.append("")

        finally:
            # Quitting driver
            driver.quit()

        # Appending links to recipe table
        self.recipes['imageLink'] = image_links

    def clean_data(self, ratings_count_treshold=10, ratings_value_treshold=3.0):

        # Method for prepping/cleaning the imported tables.

        # If there is a raw recipes table, a cleaned recipes table csv will be exported. Be aware that the ratings count and value filter
        # are applied and can be modified if necessary. The default values yields around 500 recipes

        # If there is a users table the data types will be fixed and saved in the same attribute as before.

        if not self.recipes_raw.empty:
            self._clean_recipe_table(ratings_count_treshold, ratings_value_treshold)
        if not self.users.empty:
            self._clean_users_table()

    def export_data(self, path):
        '''
        Exports the cleaned recipe table to a csv in the given path
        '''
        # Exporting csv
        self.recipes.to_csv(path, index=False)

    def connect_to_db(self):

        # This method connects with the postgresql data base whose configurations are given in the __init__ method.

        # The connection is stored as an atribute to later access.

        self.connection = psycopg2.connect(
            database=self.configurations['database'],
            user=self.configurations['user'],
            password=self.configurations['password'],
            host=self.configurations['host'],
            port=self.configurations['port']
        )

        self.connection.commit()

    def close_connection_to_db(self):

        # Closes the db connection. Its a good practice

        self.connection.close()

    # Miscelanious methods
    def _clean_recipe_table(self, ratings_count_treshold, ratings_value_treshold):

        # This method cleans the raw recipe table:

        # - adjusts the ids
        # - fix rating values formating (to 1 decimal point)
        # - drop unuseful columns
        # - create a soup from keywords, cuisine and category atributes
        # - shuffles to later use


        recipes = self.recipes_raw

        # Setting recipe_id as index
        recipes.set_index('id', inplace=True)

        # Dropping duplicates and na values
        recipes.drop_duplicates(inplace=True, subset = ['title', 'description'])
        recipes.dropna(axis='rows', inplace=True, subset=['ratingValue', 'ratingCount'])

        # Fixing rating values
        recipes['ratingValue'] = recipes['ratingValue'].apply(self.get_rating)
        recipes = recipes[recipes['ratingCount']>ratings_count_treshold]
        recipes = recipes[recipes['ratingValue']>ratings_value_treshold]

        # Dropping unuseful columns
        columns = ['recipeType', 'authorType', 'prepTime', 'cookTime', 'serving', 'nutrition', 'gotImage', 'authorName']
        recipes.drop(columns=columns, inplace=True)

        # Processing columns for soup
        recipes['keywords_merged'] = recipes['keywords'].apply(self.reduce_keywords)
        for feature in ['recipeCategory', 'recipeCuisine']:
            recipes[feature + '_merged'] = recipes[feature].apply(self.reduce_string)

        # Creating soup
        recipes['soup'] = recipes.drop(columns = ['title']).apply(self.create_soup, axis=1)

        # Shuffling recipes
        recipes = shuffle(recipes, random_state=42)

        # Dropping merged columns (not useful)
        recipes.drop(columns=['keywords_merged', 'recipeCategory_merged', 'recipeCuisine_merged'], inplace=True)

        # Reseting index
        self.recipes = recipes.reset_index(drop=True)

    def _clean_users_table(self):
        # Fixes type of data in users columns

        self.users[['recipe_id','classification']].astype('int64', copy=False)

    def get_rating(self, number):
        # Fixes the rating format by transforming
        # 459820008 -> 4.5

        string = str(number)[:2]
        rating = float(string)/10
        return rating

    def reduce_string(self, string):
        # Reduces/glues strings together for use in the soup.
        # e.g.
        # Main course -> maincourse


        if type(string) != 'str': string = str(string)
        return string.lower().replace(' ', '')

    def reduce_keywords(self, string):
        # Reduces each keyword from the list of keywords to a simpler form

        str_list = string.split(',')
        reduced = [self.reduce_string(key) for key in str_list]
        return ' '.join(reduced)

    def create_soup(self, table):
        # Creates the soup by merging the given labels.
        # This method is supposed to be used only as a map for the recipes data frame

        labels = ['recipeCategory_merged', 'recipeCuisine_merged','keywords_merged']
        return ' '.join([table[label] for label in labels])


if __name__ == "__main__":

    cuukin = Recommendation_Algorithm()

    cuukin.initialize_tables(recipe_table_name = 'recipes')

    cuukin.initialize_model()

    cuukin.sort_recommended_recipes(int(sys.argv[1]))

    cuukin.close_connection_to_db()
