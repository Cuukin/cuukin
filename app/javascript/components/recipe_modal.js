const recipeModal = () => {
  const modal = document.querySelector('.recipe-modal');
  const startRecipe = document.querySelector('#startRecipe');

  if (startRecipe) {
    modal.style.transition = "all 800ms ease-in-out";

    const openModal = () => {
      setTimeout(function() {
        modal.style.display = "block";
      }, 0);

      setTimeout(function() {
        modal.style.display = "none";
      }, 2000);
    }

    startRecipe.addEventListener('click', () => {
      openModal();
    });
  };
}

export { recipeModal };
