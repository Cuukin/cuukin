const homeCarousel = () => {
  // Get prev-next buttons and carousel divs
  const carouselSlide = document.querySelector('.home-carousel-slide');
  const carouselItem = document.querySelectorAll('.carousel-img');

  const prevBtn = document.querySelector('#prevBtn');
  const nextBtn = document.querySelector('#nextBtn');

  const progressCircles = document.querySelectorAll('.circle');

  let counter = 0;

  if (nextBtn) {
    nextBtn.addEventListener('click', () => {
      let size = carouselItem[0].clientWidth;
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter += 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      progressCircles[counter - 1].classList.add('circle-disabled');
      progressCircles[counter].classList.remove('circle-disabled');
    });
  };

  if (prevBtn) {
    prevBtn.addEventListener('click', () => {
      let size = carouselItem[0].clientWidth;
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter -= 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      progressCircles[counter + 1].classList.add('circle-disabled');
      progressCircles[counter].classList.remove('circle-disabled');
    });
  };

  // if (counter === 1) {
  //   progressCircles[0].classList.add('.circle-active');
  //   progressCircles[0].classList.remove('.circle');
  // } else if (counter === 2) {
  //   progressCircles[1].classList.add('.circle-active');
  //   progressCircles[1].classList.remove('.circle');
  // } else if (counter === 3) {
  //   progressCircles[2].classList.add('.circle-active');
  //   progressCircles[2].classList.remove('.circle');
  // } else if (counter === 4) {
  //   progressCircles[3].classList.add('.circle-active');
  //   progressCircles[3].classList.remove('.circle');
  // } else if (counter === 5) {
  //   progressCircles[4].classList.add('.circle-active');
  //   progressCircles[4].classList.remove('.circle');
  // };

  // if (carouselSlide) {
  //   carouselSlide.addEventListener('transitionend', () => {
  //     if (carouselImg[counter].id === 'img04') {
  //       // transition with 0.4s for transform etc
  //       // remove prev/next button
  //       // input register button html
  //     };
  //   });
  // };

  // delete prev button and only have next?
  // if not, first image shouldnt have the back button

  // carouselItem[counter].id !== 'last-image'
}

export { homeCarousel };
