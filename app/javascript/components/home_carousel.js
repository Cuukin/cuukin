const homeCarousel = () => {
  const firstItem = document.querySelector('.home-first-item');

  // buttons
  const startCarouselBtn = document.querySelector('#registerBtn');
  const nextBtn = document.querySelector('#nextBtn');

  const carouselNav = document.querySelector('.home-carousel-nav');
  const progressCircles = document.querySelectorAll('.circle');

  // carousel
  const carouselItems = document.querySelectorAll('.home-carousel-item');

  if (startCarouselBtn) {
    let counter = 0;

    startCarouselBtn.addEventListener('click', () => {
      firstItem.style.display = "none";
      carouselNav.style.display = "block";
      carouselItems[counter].style.display = "block";
    });

    nextBtn.addEventListener('click', () => {
      counter += 1;
      carouselItems[counter].style.display = "block";
      carouselItems[counter - 1].style.display = "none";
      progressCircles[counter].classList.remove('circle-disabled');
      progressCircles[counter - 1].classList.add('circle-disabled');
    });

  };
}

export { homeCarousel };
