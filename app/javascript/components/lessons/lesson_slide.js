const lessonChaptersSlide = () => {
  // Containers
  const lessonContainer = document.querySelector('.container-lesson');
  const lessonSlide = document.querySelector('.lesson-slide');
  const lessonChapter = document.querySelectorAll('.container-lesson-chapter');
  const lessonOverviewContainer = document.querySelector('.container-lesson-overview');

  // Buttons
  const startLessonBtn = document.querySelector('#startLesson');
  const startRecipe = document.querySelector('#startRecipe');
  const nextBtn = document.querySelectorAll('.lesson-next-btn');
  const prevBtn = document.querySelector('#prev-chap-btn');

  // Videos
  const lessonVideos = document.querySelectorAll('.lesson-slide video');

  // Progress Bar
  const progressBar = document.querySelector('.meter-progression');

  let counter = 0;

  if (lessonOverviewContainer) {
    lessonContainer.style.display = "none";
  };

  if (startLessonBtn) {
    const startLesson = () => {
      setTimeout(function() {
        lessonOverviewContainer.style.display = "none";
        lessonContainer.style.display = "block";

        counter = 0;

        window.scrollTo({
          top: 0
        });

        lessonVideos[counter].play();

        let totalItems = document.querySelectorAll('.lesson-slide > div').length;
        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';
      }, 2100);
    };

    startLessonBtn.addEventListener('click', () => {
      startLesson();
    });
  };

  if (nextBtn) {
    nextBtn.forEach((btn) => {
      btn.addEventListener('click', () => {
        let size = lessonChapter[0].clientWidth;
        lessonSlide.style.transition = "transform 0.4s ease-in-out";
        counter += 1;

        lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';

        window.scrollTo({
          top: 0
        });

        lessonVideos[counter].play();
        lessonVideos[counter - 1].pause();

        let totalItems = document.querySelectorAll('.lesson-slide > div').length;
        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';
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
        window.scrollTo({
          top: 0
        });

        lessonVideos[counter].play();
        lessonVideos[counter - 1].pause();

        let totalItems = document.querySelectorAll('.lesson-slide > div').length;
        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';
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
        counter = 0;
      } else {
        let size = lessonChapter[0].clientWidth;
        lessonSlide.style.transition = "transform 0.4s ease-in-out";
        lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';

        let totalItems = document.querySelectorAll('.lesson-slide > div').length;
        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';
      };

      lessonVideos[counter + 1].pause();
    });
  };
}

export { lessonChaptersSlide };
