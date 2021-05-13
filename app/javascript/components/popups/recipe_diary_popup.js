const recipeDiaryPopup = () => {
  const completedRecipesContainer = document.querySelector('#completedRecipes');
  const searchedRecipesContainer = document.querySelector('#searchedRecipes');

  if (completedRecipesContainer && !completedRecipesContainer.classList.contains('d-none')) {
    let recipesCards = completedRecipesContainer.querySelectorAll('.open-recipe-card');
    recipesCards.forEach((card) => {
      let recipeModal = completedRecipesContainer.querySelector(`[data-user-recipe="${card.getAttribute('data-user-recipe')}"]`);
      let closeBtn = recipeModal.querySelector('.recipe-diary-modal-close-btn');

      card.addEventListener('click', () => {
        recipeModal.style.display = "block";
      });

      closeBtn.addEventListener('click', () => {
        recipeModal.style.display = "none";
      });

      document.addEventListener('keyup', (event) => {
        if (event.key === "Escape") {
          recipeModal.style.display = "none";
        };
      });

      recipeModal.addEventListener('click', (event) => {
        if (event.target == recipeModal) {
          recipeModal.style.display = "none";
        };
      });
    });
  };
}

export { recipeDiaryPopup };
