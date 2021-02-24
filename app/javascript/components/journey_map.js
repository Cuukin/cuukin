const journeyMap = () => {
  const journeyContainer = document.querySelector('.journey-container');

  const mediaQuerySmall = window.matchMedia('(min-width: 378px)');
  const mediaQueryMedium = window.matchMedia('(min-width: 400px)');

  if (journeyContainer) {
    if (!mediaQuerySmall.matches) {
      journeyContainer.scrollLeft = 480;
    } else {
      journeyContainer.scrollLeft = 380;
    };
    // journeyContainer.scrollLeft = 380;
    // window.addEventListener('load', () => {
    //   journeyContainer.scrollLeft = 380;
    // });
  };
}

export { journeyMap };
