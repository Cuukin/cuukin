const homeCarousel = () => {
  // Get prev-next buttons and carousel divs
  const carouselSlide = document.querySelector('.home-carousel-slide');
  const carouselImg = document.querySelectorAll('.home-carousel-item');

  const prevBtn = document.querySelector('#prevBtn');
  const nextBtn = document.querySelector('#nextBtn');

  const progressCircles = document.querySelectorAll('.circle');

  let counter = 0;

  const size = carouselImg[0].clientWidth;

  if (nextBtn && carouselImg[counter].id !== 'last-image') {
    nextBtn.addEventListener('click', () => {
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter += 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      progressCircles[counter - 1].classList.add('circle-disabled');
      progressCircles[counter].classList.remove('circle-disabled');
    });
  };

  if (prevBtn) {
    prevBtn.addEventListener('click', () => {
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
}

export { homeCarousel };
