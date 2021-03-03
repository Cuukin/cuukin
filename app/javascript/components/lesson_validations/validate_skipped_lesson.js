const validateSkippedLesson = () => {
  const validateSkippedModal = document.querySelector('#validateSkippedModal');
  const validateSkippedBtn = document.querySelector('#validateSkippedBtn');
  const closeBtn = document.querySelector('#closeValidateSkippedModal');

  if (validateSkippedBtn) {
    validateSkippedBtn.addEventListener('click', () => {
      validateSkippedModal.style.display = "block";
    });

    closeBtn.addEventListener('click', () => {
      validateSkippedModal.style.display = "none";
    });
  };
}

export { validateSkippedLesson };
