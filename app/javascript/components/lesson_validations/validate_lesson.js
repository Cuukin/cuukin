const validateLesson = () => {
  const validateLessonModal = document.querySelector('#validateLessonModal');
  const validateLessonBtn = document.querySelector('#validateLessonBtn');
  const closeBtn = document.querySelector('#closeValidateModal');

  if (validateLessonBtn) {
    validateLessonBtn.addEventListener('click', () => {
      validateLessonModal.style.display = "block";
    });

    closeBtn.addEventListener('click', () => {
      validateLessonModal.style.display = "none";
    });
  };
}

export { validateLesson };
