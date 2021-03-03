  const completeLessonModal = document.querySelector('#validation-modal');
  const completeLesson = document.querySelector('#completeLesson');
  const validationCloseBtn = document.querySelector('#closeValidation');

  const validateModal = document.querySelector('#skipped-validation-modal');
  const validateLesson = document.querySelector('#validateLesson');

  const skipLessonModal = document.querySelector('#skip-modal');
  const skipLesson = document.querySelector('#unblockLesson');
  const skipCloseBtn = document.querySelector('#closeSkip');

  if (completeLesson) {
    completeLesson.addEventListener('click', () => {
      completeLessonModal.style.display = "block";
    });

    validationCloseBtn.addEventListener('click', () => {
      completeLessonModal.style.display = "none";
    });
  };

  if (validateLesson) {
    validateLesson.addEventListener('click', () => {
      validateModal.style.display = "block";
    });

    validationCloseBtn.addEventListener('click', () => {
      validateModal.style.display = "none";
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
