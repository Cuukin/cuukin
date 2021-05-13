const playground = () => {
  const completedRecipesContainer = document.querySelector('#completedRecipes');

  if (completedRecipesContainer) {
    const searchBtn = document.querySelector('#searchRecipe');

    document.addEventListener('keyup', (event) => {
      searchBtn.click();
    });
  };
};

export { playground };
