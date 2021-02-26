const recipeModal = () => {
  const modal = document.querySelector('.recipe-modal');
  const startRecipe = document.querySelector('#startRecipe');

  const completeLessonModal = document.querySelector('#validation-modal');
  const completeLesson = document.querySelector('#completeLesson');
  const validationCloseBtn = document.querySelector('#closeValidation');

  const skipLessonModal = document.querySelector('#skip-modal');
  const skipLesson = document.querySelector('#unblockLesson');
  const skipCloseBtn = document.querySelector('#closeSkip');

  if (startRecipe) {
    const openModal = () => {
      setTimeout(function() {
        modal.style.display = "block";
      }, 0);

      setTimeout(function() {
        modal.style.display = "none";
      }, 1600);
    }

    startRecipe.addEventListener('click', () => {
      openModal();
    });
  };

  if (completeLesson) {
    completeLesson.addEventListener('click', () => {
      completeLessonModal.style.display = "block";
    });

    validationCloseBtn.addEventListener('click', () => {
      completeLessonModal.style.display = "none";
    });
  };

  if (skipLesson) {
    skipLesson.addEventListener('click', () => {
      skipLessonModal.style.display = "block";
    });

    skipCloseBtn.addEventListener('click', () => {
      skipLessonModal.style.display = "block";
    });
  };
}

export { recipeModal };
