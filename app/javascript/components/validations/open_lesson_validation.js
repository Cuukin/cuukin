const openLessonValidation = () => {
  const validationModal = document.querySelector('.recipe-validation-modal');

  if (validationModal) {
    const withPhotoBtn = document.getElementById('validateLessonBtn');
    const withoutPhotoBtn = document.getElementById('validateLessonWithoutPhotoBtn');

    const formPhoto = document.getElementById('recipe-validation-item-photo');
    const formRecipe = document.getElementById('recipe-validation-item-recipe');
    const formNotes = document.getElementById('recipe-validation-item-notes');

    withPhotoBtn.addEventListener('click', () => {
      validateWithPhoto(validationModal, formPhoto, formRecipe, formNotes);
    });

    withoutPhotoBtn.addEventListener('click', () => {
      withoutPhoto(validationModal, formPhoto, formRecipe, formNotes);
    });

    const confirmPhotoBtn = document.getElementById('validateLessonConfirmPhoto');

    confirmPhotoBtn.addEventListener('click', () => {
      confirmPhoto(formPhoto, formRecipe, formNotes);
    });

    const confirmRecipeBtn = document.getElementById('validateLessonRecipeInput');

    if (confirmRecipeBtn) {
      confirmRecipeBtn.addEventListener('click', (event) => {
        confirmRecipe(formRecipe, formNotes);
      });
    };
  };
};

const validateWithPhoto = (modal, formPhoto, formRecipe, formNotes) => {
  modal.style.display = "block";
  formPhoto.style.display = "block";
};

const confirmPhoto = (formPhoto, formRecipe, formNotes) => {
  formPhoto.style.display = "none";
  if (formRecipe) {
    formRecipe.style.display = "block";
  } else {
    formNotes.style.display = "block";
  };
};

const withoutPhoto = (modal, formPhoto, formRecipe, formNotes) => {
  modal.style.display = "block";
  formPhoto.style.display = "none";

  if (formRecipe) {
    formRecipe.style.display = "block";
  } else {
    formNotes.style.display = "block";
  };
};

const confirmRecipe = (formRecipe, formNotes) => {
  formRecipe.style.display = "none";
  formNotes.style.display = "block";
};

export { openLessonValidation };
