const skipToRecipe = () => {
  // Containers
  const lessonContainer = document.querySelector('.container-lesson');
  const lessonSlide = document.querySelector('.lesson-slide');
  const lessonChapter = document.querySelectorAll('.container-lesson-chapter');
  const lessonOverviewContainer = document.querySelector('.container-lesson-overview');

  // Buttons
  const skipToRecipe = document.querySelector('#skipToRecipe');
  const oldPrevBtn = document.querySelector('#prev-chap-btn');
  const newPrevBtn = document.querySelector('#skiptorecipe-prev-btn');

  const lessonNextBtns = document.querySelectorAll('.lesson-next-btn');
  const recipeNextBtns = document.querySelectorAll('.recipe-next-btn');

  // Videos
  const lessonVideos = document.querySelectorAll('.lesson-slide video');

  // Progress Bar
  const progressBar = document.querySelector('.meter-progression');

  let totalItems = document.querySelectorAll('.lesson-slide > div')
  let totalRecipeItems = document.querySelectorAll('.container-lesson-recipe');

  let counter = 0;

  if (totalItems) {
    totalItems = totalItems.length;
    totalRecipeItems = totalRecipeItems.length;
  };

  if (skipToRecipe) {
    skipToRecipe.addEventListener('click', () => {
      oldPrevBtn.style.display = "none";
      newPrevBtn.style.display = "block";

      lessonOverviewContainer.style.display = "none";
      lessonContainer.style.display = "block";

      recipeNextBtns.forEach((recipeBtn) => {
        recipeBtn.style.display = "block";
      });

      lessonNextBtns.forEach((lessonBtn) => {
        lessonBtn.style.display = "none";
      });

      counter = totalItems - totalRecipeItems;

      let progressBarWidth = 100 * (counter + 1) / totalItems;
      progressBar.style.width = progressBarWidth + '%';

      let size = lessonChapter[0].clientWidth;
      lessonSlide.style.transition = "transform 0.4s ease-in-out";

      lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';

      window.scrollTo({
        top: 0
      });
    });
  };

  if (recipeNextBtns) {
    recipeNextBtns.forEach((btn) => {
      btn.addEventListener('click', () => {
        counter += 1;

        let size = lessonChapter[0].clientWidth;
        lessonSlide.style.transition = "transform 0.4s ease-in-out";
        lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';

        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';
      });
    });
  };

  if (newPrevBtn) {
    newPrevBtn.addEventListener('click', () => {
      counter -= 1;

      if (counter == totalItems - totalRecipeItems - 1) {
        lessonOverviewContainer.style.display = "block";
        lessonContainer.style.display = "none";

        oldPrevBtn.style.display = "block";
        newPrevBtn.style.display = "none";

        recipeNextBtns.forEach((recipeBtn) => {
          recipeBtn.style.display = "none";
        });

        lessonNextBtns.forEach((lessonBtn) => {
          lessonBtn.style.display = "block";
        });

        let size = lessonChapter[0].clientWidth;
        lessonSlide.style.transform = 'translateX(' + (-size * 1) + 'px)';

        counter = 0;
      } else {
        let progressBarWidth = 100 * (counter + 1) / totalItems;
        progressBar.style.width = progressBarWidth + '%';

        let size = lessonChapter[0].clientWidth;
        lessonSlide.style.transition = "transform 0.4s ease-in-out";
        lessonSlide.style.transform = 'translateX(' + (-size * counter) + 'px)';
      };
    });
  };

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
}

export { skipToRecipe };
