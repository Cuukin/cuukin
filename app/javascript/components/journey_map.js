const journeyMap = () => {
  const journeyContainer = document.querySelector('.journey-container');
  const journeyContent = document.querySelector('.journey-content');
  const journeyImg = document.querySelector('.journey-map');

  if (journeyContainer) {
    journeyContainer.scrollLeft = (journeyImg.scrollWidth - journeyContainer.clientWidth) / 2.4;
  };
}

export { journeyMap };
