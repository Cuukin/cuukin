const recipeDiary = () => {
  const recipesCards = document.querySelectorAll('.recipe-card');

  if (recipesCards) {
    recipesCards.forEach((card) => {
      let recipeModal = document.querySelector(`.${card.id}`);
      let closeBtn = recipeModal.querySelector('.recipe-diary-modal-close-btn');

      card.addEventListener('click', () => {
        recipeModal.style.display = "block";
      });

      closeBtn.addEventListener('click', () => {
        recipeModal.style.display = "none";
      });
    });
  };
}

export { recipeDiary };
