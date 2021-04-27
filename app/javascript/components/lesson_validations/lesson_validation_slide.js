const lessonValidationSlide = () => {
  const validateLessonNextBtn = document.querySelector('#validateLessonNext');
  const validateLessonWithoutPhotoNextBtn = document.querySelector('#validateLessonWithoutPhotoNext');
  const validateItem1 = document.querySelector('#recipe-validation-item-1');
  const validateItem2 = document.querySelector('#recipe-validation-item-2');
  const validateLessonModal = document.querySelector('#validateLessonModal');

  const rememberText = document.querySelector('#rememberPhotoText');

  const validateFunction = (btn) => {
    if (btn) {
      btn.addEventListener('click', () => {
        validateItem1.style.display = "none";
        validateItem2.style.display = "block";
      });
    };
  };

  if (validateLessonWithoutPhotoNextBtn) {
    validateLessonWithoutPhotoNextBtn.addEventListener('click', () => {
      validateLessonModal.style.display = "block";
      validateItem1.style.display = "none";
      validateItem2.style.display = "block";
      rememberText.style.display = "block";
    });
  };

  validateFunction(validateLessonNextBtn);
}

export { lessonValidationSlide };
