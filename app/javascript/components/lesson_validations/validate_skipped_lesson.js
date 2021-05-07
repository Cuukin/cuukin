const validateSkippedLesson = () => {
  const validateSkippedModal = document.querySelector('#validateSkippedModal');
  const validateSkippedBtn = document.querySelector('#validateSkippedBtn');
  const closeBtn = document.querySelector('#closeValidateSkippedModal');

  const validateItem1 = document.querySelector('#recipe-validation-item-1');
  const validateItem2 = document.querySelector('#recipe-validation-item-2');

  // const rememberText = document.querySelector('#rememberPhotoText');

  if (validateSkippedBtn) {
    validateSkippedBtn.addEventListener('click', () => {
      validateSkippedModal.style.display = "block";
      validateItem1.style.display = "block";
    });

    closeBtn.addEventListener('click', () => {
      validateSkippedModal.style.display = "none";
      validateItem2.style.display = "none";
      // rememberText.style.display = "none";
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === "Escape") {
        validateSkippedModal.style.display = "none";
        validateItem2.style.display = "none";
      };
    });

    validateSkippedModal.addEventListener('click', (event) => {
      if (event.target == validateSkippedModal) {
        validateSkippedModal.style.display = "none";
        validateItem2.style.display = "none";
      };
    });
  };
}

export { validateSkippedLesson };
