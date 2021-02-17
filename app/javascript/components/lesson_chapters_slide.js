const lessonChaptersSlide = () => {

  const lessonContainer = document.querySelector('.container-lesson');
  const lessonSlide = document.querySelector('.lesson-slide');
  const lessonChapter = document.querySelectorAll('.container-lesson-chapter');

  const lessonOverviewContainer = document.querySelector('.container-lesson-overview');

  const startLessonBtn = document.querySelector('#startLesson');

  const nextBtn = lessonContainer.querySelectorAll('.lesson-next-btn');

  const prevBtn = document.querySelector('.prev-chap-btn');

  let counter = 0;

  if (lessonOverviewContainer) {
    lessonContainer.style.display = "none";

    startLessonBtn.addEventListener('click', () => {
      lessonOverviewContainer.style.display = "none";
      lessonContainer.style.display = "block";
      counter = 0;
    });

    nextBtn.forEach((btn) => {
      btn.addEventListener('click', () => {
        let size = lessonChapter[0].clientWidth;
        lessonSlide.style.transition = "transform 0.4s ease-in-out";
        counter += 1;
        lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      });
    });

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
