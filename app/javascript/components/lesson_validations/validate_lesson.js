const validateLesson = () => {
  const validateLessonModal = document.querySelector('#validateLessonModal');
  const validateLessonBtn = document.querySelector('#validateLessonBtn');
  const closeBtn = document.querySelector('#closeValidateModal');

  const validateItem1 = document.querySelector('#recipe-validation-item-1');
  const validateItem2 = document.querySelector('#recipe-validation-item-2');

  // const rememberText = document.querySelector('#rememberPhotoText');

  if (validateLessonBtn) {
    validateLessonBtn.addEventListener('click', () => {
      validateLessonModal.style.display = "block";
      validateItem1.style.display = "block";
    });

    closeBtn.addEventListener('click', () => {
      validateLessonModal.style.display = "none";
      validateItem2.style.display = "none";
      // rememberText.style.display = "none";
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === "Escape") {
        validateLessonModal.style.display = "none";
        validateItem2.style.display = "none";
      };
    });

    validateLessonModal.addEventListener('click', (event) => {
      if (event.target == validateLessonModal) {
        validateLessonModal.style.display = "none";
        validateItem2.style.display = "none";
      };
    });
  };
}

export { validateLesson };
