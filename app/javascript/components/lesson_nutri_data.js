const lessonNutriData = () => {
  const showBtn = document.querySelector('.nutri-show-btn');
  const hideBtn = document.querySelector('.nutri-hide-btn');
  const nutriData = document.querySelector('.nutri-content');

  if (nutriData) {
    showBtn.addEventListener('click', () => {
      nutriData.style.display = "block";
      showBtn.style.display = "none";
      hideBtn.style.display = "block";
    });

    hideBtn.addEventListener('click', () => {
      nutriData.style.display = "none";
      showBtn.style.display = "block";
      hideBtn.style.display = "none";
    });
  };
}

export { lessonNutriData };
