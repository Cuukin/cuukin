let counter = 0;

// large containers
const methodsContainer = document.querySelector('.recipe-methods-container');
const recipeOverview = document.querySelector('.container-recipe-overview');

// method cards
const methodsCards = document.querySelectorAll('.recipe-method-card');
const progressBar = document.querySelector('.meter-progression');
const nextBtn = document.querySelector('#nextMethod');

const recipeMethods = () => {
  const makeRecipe = document.querySelector('#makeRecipe');

  if (makeRecipe) {
    // btns
    const nextMethods = document.querySelectorAll('.nextMethod');
    const prevMethod = document.querySelector('#prevMethod');

    let totalItems = methodsCards.length;

    makeRecipe.addEventListener('click', () => {
      window.scrollTo({top: 0});
      recipeOverview.style.display = "none";
      methodsContainer.style.display = "block";
      methodsCards[0].style.display = "block";

      let progressBarWidth = 100 * (counter + 1) / totalItems;
      progressBar.style.width = progressBarWidth + '%';
    });

    nextMethods.forEach((nextMethod) => {
      nextMethod.addEventListener('click', () => {
        counter += 1;
        window.scrollTo({top: 0});

        methodsCards[counter - 1].style.display = "none";
        methodsCards[counter - 1].querySelector('.methodVideo').pause();
        methodsCards[counter].style.display = "block";

        if (counter == methodsCards.length - 1) {
          nextBtn.style.pointerEvents = "none";
        };

        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';
      });
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === 'ArrowRight' && counter < methodsCards.length - 1) {
        counter += 1;
        window.scrollTo({top: 0});

        methodsCards[counter - 1].style.display = "none";
        methodsCards[counter - 1].querySelector('.methodVideo').pause();
        methodsCards[counter].style.display = "block";

        if (counter == methodsCards.length - 1) {
          nextBtn.style.pointerEvents = "none";
        };

        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';
      };
    });

    prevMethod.addEventListener('click', () => {
      counter -= 1;
      nextBtn.style.pointerEvents = "auto";
      // nextMethods.forEach((nextMethod) => {
      //   nextMethod.style.pointerEvents = "auto";
      // });
      window.scrollTo({top: 0});

      if (counter == -1) {
        counter = 0;
        recipeOverview.style.display = "block";
        methodsContainer.style.display = "none";
        methodsCards[counter].style.display = "none";
        methodsCards[counter].querySelector('.methodVideo').pause();
      } else {
        methodsCards[counter + 1].style.display = "none";
        methodsCards[counter + 1].querySelector('.methodVideo').pause();
        methodsCards[counter].style.display = "block";
        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';
      };
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === 'ArrowLeft') {
        counter -= 1;
        nextBtn.style.pointerEvents = "auto";
        // nextMethods.forEach((nextMethod) => {
        //   nextMethod.style.pointerEvents = "auto";
        // });
        window.scrollTo({top: 0});

        if (counter == -1) {
          counter = 0;
          recipeOverview.style.display = "block";
          methodsContainer.style.display = "none";
          methodsCards[counter].style.display = "none";
          methodsCards[counter].querySelector('.methodVideo').pause();
        } else {
          methodsCards[counter + 1].style.display = "none";
          methodsCards[counter + 1].querySelector('.methodVideo').pause();
          methodsCards[counter].style.display = "block";
          let progressBarWidth = 100 * (counter + 1) / totalItems;
          progressBar.style.width = progressBarWidth + '%';
        };
      };
    });
  };
};

const swipe = () => {
  const swipeArea = document.querySelector('.recipe-methods-container-cards');

  if (swipeArea) {
    swipeArea.addEventListener('touchstart', handleTouchStart, {passive: true});
    swipeArea.addEventListener('touchmove', handleTouchMove, {passive: true});

    let totalItems = methodsCards.length;

    let xDown = null;
    let yDown = null;

    function getTouches(evt) {
      return evt.touches
    };

    function handleTouchStart(evt) {
        const firstTouch = getTouches(evt)[0];
        xDown = firstTouch.clientX;
        yDown = firstTouch.clientY;
    };

    if (methodsCards[methodsCards.length - 1].style.display !== "block") {

    };

    function handleTouchMove(evt) {
      if ( ! xDown || ! yDown ) {
        return;
      }

      let xUp = evt.touches[0].clientX;
      let yUp = evt.touches[0].clientY;

      let xDiff = xDown - xUp;
      let yDiff = yDown - yUp;

      if ( Math.abs( xDiff ) > Math.abs( yDiff ) ) {/*most significant*/
          if ( xDiff > 0 ) {
            counter += 1;
            if (counter >= methodsCards.length) {
              counter = methodsCards.length - 1;
              nextBtn.style.pointerEvents = "none";
            } else {
              window.scrollTo({top: 0});
              methodsCards[counter - 1].style.display = "none";
              methodsCards[counter - 1].querySelector('.methodVideo').pause();
              methodsCards[counter].style.display = "block";
              let progressBarWidth = 100 * (counter + 1) / totalItems;
              progressBar.style.width = progressBarWidth + '%';
            };
          } else {
            counter -= 1;
            window.scrollTo({top: 0});
            nextBtn.style.pointerEvents = "auto";
            if (counter == -1) {
              counter = 0;
              recipeOverview.style.display = "block";
              methodsContainer.style.display = "none";
              methodsCards[counter].style.display = "none";
              methodsCards[counter].querySelector('.methodVideo').pause();
            } else {
              methodsCards[counter + 1].style.display = "none";
              methodsCards[counter + 1].querySelector('.methodVideo').pause();
              methodsCards[counter].style.display = "block";
              let progressBarWidth = 100 * (counter + 1) / totalItems;
              progressBar.style.width = progressBarWidth + '%';
            };
          };
      } else {
          if ( yDiff > 0 ) {
              /* up swipe */
          } else {
              /* down swipe */
          };
      };
      /* reset values */
      xDown = null;
      yDown = null;
    };
  };
};


export { recipeMethods, swipe };
