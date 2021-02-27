const lessonChaptersSlide = () => {

  const lessonContainer = document.querySelector('.container-lesson');
  const lessonSlide = document.querySelector('.lesson-slide');
  const lessonChapter = document.querySelectorAll('.container-lesson-chapter');

  const lessonOverviewContainer = document.querySelector('.container-lesson-overview');

  const startLessonBtn = document.querySelector('#startLesson');

  const nextBtn = document.querySelectorAll('.lesson-next-btn');

  const prevBtn = document.querySelector('#prev-chap-btn');

  const startRecipe = document.querySelector('#startRecipe');

  let counter = 0;

  if (lessonOverviewContainer) {
    lessonContainer.style.display = "none";
  };

  if (startLessonBtn) {
    startLessonBtn.addEventListener('click', () => {
      lessonOverviewContainer.style.display = "none";
      lessonContainer.style.display = "block";
      counter = 0;
    });
  };

  if (nextBtn) {
    nextBtn.forEach((btn) => {
      btn.addEventListener('click', () => {
        let size = lessonChapter[0].clientWidth;
        lessonSlide.style.transition = "transform 0.4s ease-in-out";
        counter += 1;
        lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      });
    });
  };

  if (startRecipe) {
    const moveSlider = () => {
      setTimeout(function() {
        let size = lessonChapter[0].clientWidth;
        lessonSlide.style.transition = "transform 0.4s ease-in-out";
        counter += 1;
        lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      }, 2100);
    }

    startRecipe.addEventListener('click', () => {
      moveSlider();
    });
  };

  if (prevBtn) {
    prevBtn.addEventListener('click', () => {
      counter -= 1;

      if (counter == -1) {
        lessonOverviewContainer.style.display = "block";
        lessonContainer.style.display = "none";
      } else {
        let size = lessonChapter[0].clientWidth;
        lessonSlide.style.transition = "transform 0.4s ease-in-out";
        lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      };
    });
  };
}

export { lessonChaptersSlide };
