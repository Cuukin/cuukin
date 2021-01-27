const homeCarousel = () => {
  // Get prev-next buttons and carousel divs
  const carouselContainer = document.querySelector('.home-carousel-container');
  const carouselSlide = document.querySelector('.home-carousel-slide');
  const carouselItem = document.querySelectorAll('.carousel-img');
  const carouselNav = document.querySelector('.home-carousel-nav');

  const primaryBtns = document.querySelector('.carousel-primary-btns');
  const startBtn = document.querySelector('#startBtn');
  const prevBtn = document.querySelector('#prevBtn');
  const nextBtn = document.querySelector('#nextBtn');

  const progressCircles = document.querySelectorAll('.circle');

  let counter = 0;

  carouselNav.style.display = "none";
  prevBtn.style.display = "none";

  if (startBtn) {
    startBtn.addEventListener('click', () => {
      let size = carouselItem[0].clientWidth;
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter += 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      primaryBtns.style.display = "none";
      carouselNav.style.display = "block";
      prevBtn.style.display = "block";

      // const text = `<div class='home-progress-bar'>
      //           <div class='circle'></div>
      //           <div class='circle circle-disabled'></div>
      //           <div class='circle circle-disabled'></div>
      //           <div class='circle circle-disabled'></div>
      //           <div class='circle circle-disabled'></div>
      //           <div class='circle circle-disabled'></div>
      //         </div>

      //         <div class='home-carousel-btns'>
      //           <div class='next-btn' id='nextBtn'><i class='fas fa-chevron-right'></i></div>
      //         </div>`;

      // const prev = `<div class="carousel-previous">
      //                 <div class="previous-btn" id="prevBtn"><i class="fas fa-chevron-left"></i></div>
      //               </div>`

      // carouselContainer.insertAdjacentHTML('beforeend', text);
      // carouselContainer.insertAdjacentHTML('afterbegin', prev);
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
    });
  };

  if (prevBtn) {
    prevBtn.addEventListener('click', () => {
      let size = carouselItem[0].clientWidth;
      carouselSlide.style.transition = "transform 0.4s ease-in-out";
      counter -= 1;
      carouselSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      progressCircles[counter].classList.add('circle-disabled');
      progressCircles[counter - 1].classList.remove('circle-disabled');

      if (carouselSlide.scrollWidth <= size) {
        carouselNav.style.display = "none";
        prevBtn.style.display = "none";
        primaryBtns.style.display = "block";
      }
    });
  };

  // `<%= link_to 'Register to Cuukin', new_user_registration_path, class: 'primary-btn' %>`

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
