const lessonChaptersSlide = () => {
  const lessonContainer = document.querySelector('.container-lesson');
  const lessonSlide = document.querySelector('.lesson-slide');
  const lessonChapter = document.querySelectorAll('.container-lesson-chapter');

  let totalItems = document.querySelectorAll('.lesson-slide > div');

  const lessonOverviewContainer = document.querySelector('.container-lesson-overview');

  const startLessonBtn = document.querySelector('#startLesson');

  const nextBtn = document.querySelectorAll('.lesson-next-btn');

  const prevBtn = document.querySelector('#prev-chap-btn');
  const skipToRecipePrevBtn = document.querySelector('#skiptorecipe-prev-btn');

  const startRecipe = document.querySelector('#startRecipe');

  const skipToRecipe = document.querySelector('#skipToRecipe');

  const lessonVideos = document.querySelectorAll('.lesson-slide video');

  let counter = 0;

  const progressBar = document.querySelector('.meter-progression');

  if (lessonOverviewContainer) {
    lessonContainer.style.display = "none";
  };

  if (skipToRecipe) {
    skipToRecipe.addEventListener('click', () => {
      lessonOverviewContainer.style.display = "none";
      lessonContainer.style.display = "block";

      totalItems = totalItems.length;
      let totalRecipeItems = document.querySelectorAll('.container-lesson-recipe').length;
      counter = totalItems - totalRecipeItems;

      let progressBarWidth = 100 * (counter + 1) / totalItems;
      progressBar.style.width = progressBarWidth + '%';

      let size = lessonChapter[0].clientWidth;
      lessonSlide.style.transition = "transform 0.4s ease-in-out";

      lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';

      window.scrollTo({
        top: 0
      });

      // prevBtn.style.display = "none";
      // skipToRecipePrevBtn.style.display = "block";

      // if (counter == totalItems - totalRecipeItems) {
      //   skipToRecipePrevBtn.addEventListener('click', () => {
      //     lessonOverviewContainer.style.display = "block";
      //     lessonContainer.style.display = "none";
      //     counter = 0;
      //     prevBtn.style.display = "block";
      //     skipToRecipePrevBtn.style.display = "none";
      //     lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      //   });
      // } else {
      //   counter -= 1;
      //   progressBarWidth = 100 * (counter + 1) / totalItems;
      //   progressBar.style.width = progressBarWidth + '%';
      // };

      // display none on prevBtn, display block on skipRecipePrevBtn
      // add onClick on it
      // if (counter == totalItems - totalRecipeItems)
      // then go back to Lesson Overview Container and set counter to 0
      // and display block on prevBtn and none on skipRecipePrevBtn
      // else then lessonSlide.style.transform translating with counter - 1
    });
  };

  if (startLessonBtn) {
    startLessonBtn.addEventListener('click', () => {
      lessonOverviewContainer.style.display = "none";
      lessonContainer.style.display = "block";
      counter = 0;
      window.scrollTo({
        top: 0
      });

      lessonVideos[counter].play();

      totalItems = totalItems.length;
      let progressBarWidth = 100 * (counter + 1) / totalItems;
      progressBar.style.width = progressBarWidth + '%';
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
