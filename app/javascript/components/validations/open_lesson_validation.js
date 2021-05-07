const openLessonValidation = () => {
  const validationModal = document.getElementById('validateLessonModal');

  if (validationModal) {
    const withPhotoBtn = document.getElementById('validateLessonBtn');
    const withoutPhotoBtn = document.getElementById('validateLessonWithoutPhotoBtn');
    const photoForm = document.getElementById('recipe-validation-item-1');
    const secondForm = document.getElementById('recipe-validation-item-2');

    withPhotoBtn.addEventListener('click', () => {
      validateWithPhoto(validationModal, photoForm, secondForm);
    });

    withoutPhotoBtn.addEventListener('click', () => {
      withoutPhoto(validationModal, photoForm, secondForm);
    });

    const confirmBtn = document.getElementById('validateLessonNext');

    confirmBtn.addEventListener('click', () => {
      confirmPhoto(photoForm, secondForm);
    });
  };
};

const validateWithPhoto = (modal, form1, form2) => {
  modal.style.display = "block";
  form1.style.display = "block";
};

const confirmPhoto = (form1, form2) => {
  form1.style.display = "none";
  form2.style.display = "block";
};

const withoutPhoto = (modal, form1, form2) => {
  modal.style.display = "block";
  form1.style.display = "none";
  form2.style.display = "block";
};

export { openLessonValidation };
