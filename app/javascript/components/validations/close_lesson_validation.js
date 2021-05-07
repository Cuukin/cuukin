const closeLessonValidation = () => {
  const validationModal = document.querySelector('.recipe-validation-modal');

  if (validationModal) {
    const closeBtn = validationModal.querySelector('.modal-close-btn');
    const formItems = document.querySelectorAll('.validation-item');

    closeBtn.addEventListener('click', (event) => {
      closeValidationPopup(validationModal, formItems);
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === "Escape") {
        closeValidationPopup(validationModal, formItems);
      };
    });

    validationModal.addEventListener('click', (event) => {
      if (event.target == validationModal) {
        closeValidationPopup(validationModal, formItems);
      };
    });
  };
};

const closeValidationPopup = (modal, formItems) => {
  modal.style.display = "none";
  formItems.forEach((formItem) => {
    formItem.style.display = "none";
  });
};

export { closeLessonValidation };
