const journeyMap = () => {
  const journeyContainer = document.querySelector('.journey-container');

  if (journeyContainer) {
    journeyContainer.scrollLeft = 380;
    // window.addEventListener('load', () => {
    //   journeyContainer.scrollLeft = 380;
    // });
  };
}

export { journeyMap };
