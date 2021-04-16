const homeCarousel = () => {
  const startCarouselBtn = document.querySelector('#registerBtn');

  // carousel
  const carouselItems = document.querySelectorAll('.home-carousel-item');

  if (startCarouselBtn) {
    const firstItem = document.querySelector('.home-first-item');
    // buttons
    const nextBtn = document.querySelector('#nextBtn');
    const prevBtn = document.querySelector('#prevBtn');
    const finishCarouselBtn = document.querySelector('#finishCarouselBtn');
    //nav
    const carouselNav = document.querySelector('.home-carousel-nav');
    const progressCircles = document.querySelectorAll('.circle');
    // carousel
    const carouselItems = document.querySelectorAll('.home-carousel-item');

    let counter = 0;

    startCarouselBtn.addEventListener('click', () => {
      firstItem.style.display = "none";

      carouselNav.style.display = "block";
      prevBtn.style.display = "block";

      carouselItems[counter].style.display = "block";

      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });

    nextBtn.addEventListener('click', () => {
      counter += 1;

      carouselItems[counter].style.display = "block";
      carouselItems[counter - 1].style.display = "none";

      progressCircles[counter].classList.remove('circle-disabled');
      progressCircles[counter - 1].classList.add('circle-disabled');

      if (counter == 1) {
        nextBtn.style.display = "none";
        finishCarouselBtn.style.display = "block";
      };

      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });

    prevBtn.addEventListener('click', () => {
      if (counter == 0) {
        counter = 0;

        firstItem.style.display = "block";

        carouselNav.style.display = "none";
        prevBtn.style.display = "none";

        carouselItems[counter].style.display = "none";
      } else {
        counter -= 1;

        carouselItems[counter + 1].style.display = "none";
        carouselItems[counter].style.display = "block";

        progressCircles[counter + 1].classList.add('circle-disabled');
        progressCircles[counter].classList.remove('circle-disabled');

        nextBtn.style.display = "block";
        finishCarouselBtn.style.display = "none";
      };
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
  };
}

export { homeCarousel };
