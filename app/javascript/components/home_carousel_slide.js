const homeCarousel = () => {
  // Get prev-next buttons and carousel divs
  const carouselSlide = document.querySelector('.home-carousel-slide');
  const carouselImg = document.querySelectorAll('.carousel-img');

  const prevBtn = document.querySelector('#prevBtn');
  const nextBtn = document.querySelector('#nextBtn');

  let counter = 0;

  const size = carouselImg[0].clientWidth;

  if (nextBtn) {
    nextBtn.addEventListener('click', () => {
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter += 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
    });
  };

  if (prevBtn) {
    prevBtn.addEventListener('click', () => {
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter -= 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
    });
  };

  // if (carouselSlide) {
  //   carouselSlide.addEventListener('transitionend', () => {
  //     if (carouselImg[counter].id === 'img04') {
  //       // transition with 0.4s for transform etc
  //       // remove prev/next button
  //       // input register button html
  //     };
  //   });
  // };
}

export { homeCarousel };
