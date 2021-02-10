const recipeModal = () => {
  const modal = document.querySelector('.recipe-modal');
  const startRecipe = document.querySelector('#startRecipe');

  const completeLessonModal = document.querySelector('.recipe-validation-modal');
  const completeLesson = document.querySelector('#completeLesson');
  const modalCloseBtn = document.querySelector('.modal-close-btn');

  if (startRecipe) {
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

  if (completeLesson) {
    completeLesson.addEventListener('click', () => {
      completeLessonModal.style.display = "block";
    });

    modalCloseBtn.addEventListener('click', () => {
      completeLessonModal.style.display = "none";
    });
  };
}

export { recipeModal };
