const closeLessonValidation = () => {
  const validationModal = document.getElementById('validateLessonModal');

  if (validationModal) {
    const closeBtn = validationModal.querySelector('.modal-close-btn');
    const photoForm = document.getElementById('recipe-validation-item-1');
    const secondForm = document.getElementById('recipe-validation-item-2');

    closeBtn.addEventListener('click', (event) => {
      closeValidationPopup(validationModal, photoForm, secondForm);
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === "Escape") {
        closeValidationPopup(validationModal, photoForm, secondForm);
      };
    });

    validationModal.addEventListener('click', (event) => {
      if (event.target == validationModal) {
        closeValidationPopup(validationModal, photoForm, secondForm);
      };
    });
  };
};

const closeValidationPopup = (modal, form1, form2) => {
  modal.style.display = "none";
  form1.style.display = "block";
  form2.style.display = "none";
};

export { closeLessonValidation };
