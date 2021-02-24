const journeyMap = () => {
  const journeyContainer = document.querySelector('.journey-container');

  const mediaQuerySmall = window.matchMedia('(min-width: 480px)');
  const mediaQueryXSmall = window.matchMedia('(max-width: 338px)');

  if (journeyContainer) {
    // if (!mediaQuerySmall.matches) {
    //   journeyContainer.scrollLeft = 380;
    // } else {
    //   journeyContainer.scrollLeft = 280;
    // };
    journeyContainer.scrollLeft = 380;
    // window.addEventListener('load', () => {
    //   journeyContainer.scrollLeft = 380;
    // });
  };
}

export { journeyMap };
