const skipToRecipe = () => {
  const lessonChapter = document.querySelectorAll('.container-lesson-chapter');
  const lessonOverviewContainer = document.querySelector('.container-lesson-overview');
  const skipToRecipePrevBtn = document.querySelector('#skiptorecipe-prev-btn');

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
}

export { skipToRecipe }
