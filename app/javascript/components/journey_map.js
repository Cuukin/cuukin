const journeyMap = () => {
  const journeyContainer = document.querySelector('.journey-container');
  const journeyImg = document.querySelector('.journey-map');
  const locateBtn = document.querySelector('#locateBtn');

  if (journeyContainer) {
    journeyContainer.scrollLeft = (journeyImg.scrollWidth - journeyContainer.clientWidth) / 2.1;
  };

  if (locateBtn) {
    locateBtn.addEventListener('click', () => {

      journeyContainer.scrollTo({
        top: 0,
        left: (journeyImg.scrollWidth - journeyContainer.clientWidth) / 2.1,
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
