const journeyMap = () => {
  const journeyContainer = document.querySelector('.journey-container');
  const journeyContent = document.querySelector('.journey-content');

  // const mediaQuerySmall = window.matchMedia('(min-width: 378px)');
  // const mediaQueryMedium = window.matchMedia('(min-width: 400px)');

  if (journeyContainer) {
    journeyContainer.scrollLeft = (journeyContent.scrollWidth - journeyContainer.clientWidth) / 2.4;

    // if (!mediaQuerySmall.matches) {
    //   journeyContainer.scrollLeft = 480;
    // } else {
    //   journeyContainer.scrollLeft = 380;
    // };

    // journeyContainer.scrollIntoView({
    //   behavior: "smooth",
    //   inline: "center"
    // }); // only centers horizontally

    // window.addEventListener('load', () => {
    //   journeyContainer.scrollLeft = 380;
    // });
  };
}

export { journeyMap };
