const journeyMap = () => {
  const journeyContainer = document.querySelector('.journey-container');
  const journeyImg = document.querySelector('.journey-map');
  const locateBtn = document.querySelector('#locateBtn');

  if (journeyContainer) {
    journeyContainer.scrollLeft = (journeyImg.scrollWidth - journeyContainer.clientWidth) / 2.4;
  };

  if (locateBtn) {
    locateBtn.addEventListener('click', () => {

      journeyContainer.scrollTo({
        left: (journeyImg.scrollWidth - journeyContainer.clientWidth) / 2.4,
        behavior: 'smooth'
      });

      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });

    });
  };
}

export { journeyMap };
