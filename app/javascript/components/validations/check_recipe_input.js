const checkRecipeInput = () => {
  const recipeInputsContainer = document.querySelector('.lesson-validation-recipes-container');
  const submitBtn = document.querySelector('#submitValidation');
  const confirmRecipe = document.querySelector('#validateLessonRecipeInput');

  if (recipeInputsContainer) {
    const recipeInputs = recipeInputsContainer.querySelectorAll('.form-check-input');

    recipeInputs.forEach((input) => {
      if (!input.clicked) {
        submitBtn.style.pointerEvents = "none";
        confirmRecipe.style.pointerEvents = "none";
      };

      input.addEventListener('click', (event) => {
        submitBtn.classList.remove('disabled-btn');
        submitBtn.classList.add('primary-btn');
        submitBtn.style.pointerEvents = "auto";
        confirmRecipe.classList.remove('disabled-btn');
        confirmRecipe.classList.add('primary-btn');
        confirmRecipe.style.pointerEvents = "auto";
      });
    });
  };
};

export { checkRecipeInput };
