const recipeDiary = () => {
  const recipesCards = document.querySelectorAll('#completedRecipes > .recipe-card');

  if (recipesCards) {
    recipesCards.forEach((card) => {
      card.addEventListener('click', () => {
        let recipeModal = document.querySelector(`.${card.id}`);
        recipeModal.style.display = "block";

        let closeBtn = recipeModal.querySelector('.recipe-diary-modal-close-btn');
        closeBtn.addEventListener('click', () => {
          recipeModal.style.display = "none";
        });
      });
    });
  };
}

export { recipeDiary };
