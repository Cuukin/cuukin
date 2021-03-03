const lessonValidationSlide = () => {
  const validateLessonNextBtn = document.querySelector('#validateLessonNext');
  const validateItem1 = document.querySelector('#recipe-validation-item-1');
  const validateItem2 = document.querySelector('#recipe-validation-item-2');

  if (validateLessonNextBtn) {
    validateLessonNextBtn.addEventListener('click', () => {
      validateItem1.style.display = "none";
      validateItem2.style.display = "block";
    });
  };
}

export { lessonValidationSlide };
