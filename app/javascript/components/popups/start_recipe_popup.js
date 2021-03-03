const recipeModal = () => {
  const startRecipeModal = document.querySelector('.recipe-modal');
  const startRecipe = document.querySelector('#startRecipe');

  if (startRecipe) {
    const openModal = () => {
      setTimeout(function() {
        startRecipeModal.style.display = "block";
      }, 0);

      setTimeout(function() {
        startRecipeModal.style.display = "none";
      }, 1600);
    }

    startRecipe.addEventListener('click', () => {
      openModal();
    });
  };
}

export { recipeModal };
