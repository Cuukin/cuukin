const recipeSwipeCard = () => {
  const swipeUpBtn = document.querySelector('#markAsComplete');

  if (swipeUpBtn) {
    const swipeModal = document.querySelector('.container-user-recipe-validation');
    const recipeOverviewCard = document.querySelector('.card-recipe-overview');
    const swipeArea = document.querySelector('.container-recipe-overview');

    swipeModal.style.transition = 'all ease-in-out .6s';

    swipeUpBtn.addEventListener('click', (event) => {
      document.body.style.overflow = 'hidden';
      swipeModal.style.transform = 'translateY(-293px)';
    });

    swipeModal.addEventListener('click', (event) => {
      swipeModal.style.transform = 'translateY(230px)';
      document.body.style.overflow = '';
    });

    swipeArea.addEventListener('touchstart', handleTouchStart, {passive: true});
    swipeArea.addEventListener('touchmove', handleTouchMove, {passive: true});

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
          } else {
          };
      } else {
          if ( yDiff > 0 ) {
          } else {
            swipeModal.style.transform = 'translateY(230px)';
            setTimeout(function() {
              document.body.style.overflow = '';
            }, 2000);
          };
      };
      /* reset values */
      xDown = null;
      yDown = null;
    };
  };
};

export { recipeSwipeCard };
