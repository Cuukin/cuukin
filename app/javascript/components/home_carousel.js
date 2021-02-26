const homeCarousel = () => {
  // Get carousel divs
  const carouselContainer = document.querySelector('.home-carousel-container');
  const carouselSlide = document.querySelector('.home-carousel-slide');
  const carouselItem = document.querySelectorAll('.carousel-img');
  const carouselNav = document.querySelector('.home-carousel-nav');

  // Get prev/next buttons and navbars
  const primaryBtns = document.querySelector('.carousel-primary-btns');
  const startBtn = document.querySelector('#startBtn');
  const prevBtn = document.querySelector('#prevBtn');
  const nextBtn = document.querySelector('#nextBtn');
  const registerBtn = document.querySelector('.registerBtn');

  const progressCircles = document.querySelectorAll('.circle');

  let counter = 0;

  if (carouselNav && prevBtn && registerBtn) {
    carouselNav.style.display = "none";
    prevBtn.style.display = "none";
    registerBtn.style.display = "none";
  };

  if (startBtn) {
    startBtn.addEventListener('click', () => {
      let size = carouselItem[0].clientWidth;
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter += 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      primaryBtns.style.display = "none";
      carouselNav.style.display = "block";
      prevBtn.style.display = "block";
    });
  };

  if (nextBtn) {
    nextBtn.addEventListener('click', () => {
      let size = carouselItem[0].clientWidth;
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter += 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      progressCircles[counter - 2].classList.add('circle-disabled');
      progressCircles[counter - 1].classList.remove('circle-disabled');

      if (counter == 5) {
        nextBtn.style.display = "none";
        registerBtn.style.display = "block";
      };
    });
  };

  if (prevBtn) {
    prevBtn.addEventListener('click', () => {
      let size = carouselItem[0].clientWidth;
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter -= 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';

      if (progressCircles[counter] && progressCircles[counter-1]) {
        progressCircles[counter].classList.add('circle-disabled');
        progressCircles[counter - 1].classList.remove('circle-disabled');
      };

      if (counter == 4) {
        nextBtn.style.display = "block";
        registerBtn.style.display = "none";
      };

      if (counter == 0) {
        primaryBtns.style.display = "block";
        carouselNav.style.display = "none";
        prevBtn.style.display = "none";
      };
    });
  };
}

export { homeCarousel };
