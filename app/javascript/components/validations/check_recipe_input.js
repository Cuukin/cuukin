const checkRecipeInput = () => {
  const recipeInputsContainer = document.querySelector('.lesson-validation-recipes-container');
  const submitBtn = document.querySelector('#submitValidation');

  if (recipeInputsContainer) {
    const recipeInputs = recipeInputsContainer.querySelectorAll('.form-check-input');
    recipeInputs.forEach((input) => {
      if (!input.clicked) {
        submitBtn.style.pointerEvents = "none";
      };

      input.addEventListener('click', (event) => {
        submitBtn.classList.remove('disabled-btn');
        submitBtn.classList.add('primary-btn');
        submitBtn.style.pointerEvents = "auto";
      });
    });
  };
};

export { checkRecipeInput };
