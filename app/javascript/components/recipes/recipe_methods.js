const recipeMethods = () => {
  const makeRecipe = document.querySelector('#makeRecipe');

  if (makeRecipe) {
    // large containers
    const recipeOverview = document.querySelector('.container-recipe-overview');
    const methodsContainer = document.querySelector('.recipe-methods-container');

    // btns
    const nextMethod = document.querySelector('#nextMethod');
    const prevMethod = document.querySelector('#prevMethod');
    const progressBar = document.querySelector('.meter-progression');

    // method cards
    const methodsCards = document.querySelectorAll('.recipe-method-card');

    let counter = 0;
    let totalItems = methodsCards.length;

    makeRecipe.addEventListener('click', () => {
      window.scrollTo({top: 0});
      recipeOverview.style.display = "none";
      methodsContainer.style.display = "block";
      methodsCards[0].style.display = "block";

      let progressBarWidth = 100 * (counter + 1) / totalItems;
      progressBar.style.width = progressBarWidth + '%';
    });

    nextMethod.addEventListener('click', () => {
      counter += 1;
      window.scrollTo({top: 0});

      methodsCards[counter - 1].style.display = "none";
      methodsCards[counter].style.display = "block";

      if (counter == methodsCards.length - 1) {
        nextMethod.style.pointerEvents = "none";
      }

      let progressBarWidth = 100 * (counter + 1) / totalItems;
      progressBar.style.width = progressBarWidth + '%';
    });

    prevMethod.addEventListener('click', () => {
      counter -= 1;
      nextMethod.style.pointerEvents = "auto";
      window.scrollTo({top: 0});

      if (counter == -1) {
        counter = 0;
        recipeOverview.style.display = "block";
        methodsContainer.style.display = "none";
        methodsCards[counter + 1].style.display = "none";
      } else {
        methodsCards[counter + 1].style.display = "none";
        methodsCards[counter].style.display = "block";
        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';
      };
    });
  };
};

export { recipeMethods };