const recipeSearch = () => {
  const completedRecipesContainer = document.querySelector('#completedRecipes');
  const unlockedRecipesContainer = document.querySelector('#unlockedRecipes');

  if (completedRecipesContainer) {
    const searchRecipesContainer = document.querySelector('#searchedRecipes');
    const searchInput = document.querySelector('.search-form-control');
    const searchBtn = document.querySelector('#searchRecipe');

    document.addEventListener('keyup', (event) => {
      searchBtn.click();

      if (searchInput.value == "") {
        searchRecipesContainer.classList.add('d-none');

        if (completedRecipesContainer.classList.contains('d-none')) {
          unlockedRecipesContainer.classList.remove('d-none');
        } else {
          completedRecipesContainer.classList.remove('d-none');
        };
      };
    });
  };
};

export { recipeSearch };
