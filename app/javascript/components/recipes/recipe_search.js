const recipeSearch = () => {
  const completedRecipesContainer = document.querySelector('#completedRecipes');
  const unlockedRecipesContainer = document.querySelector('#unlockedRecipes');

  const unlockedBtn = document.querySelector('#unlockedBtn');
  const completedBtn = document.querySelector('#completedBtn');

  if (completedRecipesContainer) {
    const searchRecipesContainer = document.querySelector('#searchedRecipes');
    const searchInput = document.querySelector('.search-form-control');
    const searchBtn = document.querySelector('#searchRecipe');

    document.addEventListener('keyup', (event) => {
      searchBtn.click();

      if (searchInput.value == "") {
        searchRecipesContainer.classList.add('d-none');

        if (completedBtn.classList.contains('recipe-navbar-active')) {
          completedRecipesContainer.classList.remove('d-none');
        } else {
          unlockedRecipesContainer.classList.remove('d-none');
        };
      };
    });
  };
};

export { recipeSearch };
