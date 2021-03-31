const homeCarousel = () => {
  const firstItem = document.querySelector('.home-first-item');

  // buttons
  const startCarouselBtn = document.querySelector('#registerBtn');
  const carouselNav = document.querySelector('.home-carousel-nav');
  const nextBtn = document.querySelector('#nextBtn');

  // carousel
  const carouselSlide = document.querySelector('.home-carousel-slide');
  const carouselItems = document.querySelectorAll('.carousel-img');

  const slide = document.querySelector('.home-carousel-slide');

  if (startCarouselBtn) {
    let counter = 0;
    let size = carouselItems[0].clientWidth;
    carouselSlide.style.transition = "transform 0.4s ease-in-out";

    startCarouselBtn.addEventListener('click', () => {
      firstItem.style.display = "none";
      slide.style.display = "flex";
      carouselNav.style.display = "block";
    });

    nextBtn.addEventListener('click', () => {
      counter += 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
    });
  };
}

export { homeCarousel };
