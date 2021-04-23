const lessonNutriData = () => {
  const showBtn = document.querySelector('.nutri-show-btn');
  const hideBtn = document.querySelector('.nutri-hide-btn');
  const nutriData = document.querySelector('.nutri-content');
  const nutriBtn = document.querySelector('.nutri-btn');

  if (nutriData) {
    showBtn.addEventListener('click', () => {
      if (showBtn.style.transform == "rotate(0deg)" || showBtn.style.transform == "") {
        nutriData.style.display = "block";
        showBtn.style.transform = 'rotate(180deg)';
        setTimeout(function() {
          nutriData.style.opacity = 1;
        }, 50);
      } else if (showBtn.style.transform == "rotate(180deg)") {
        nutriData.style.opacity = .1;
        showBtn.style.transform = 'rotate(0deg)';

        setTimeout(function() {
          nutriData.style.display = "none";
        }, 200);
      };
    });

    nutriBtn.addEventListener('click', () => {
      if (showBtn.style.transform == "rotate(0deg)" || showBtn.style.transform == "") {
        nutriData.style.display = "block";
        showBtn.style.transform = 'rotate(180deg)';
        setTimeout(function() {
          nutriData.style.opacity = 1;
        }, 50);
      } else if (showBtn.style.transform == "rotate(180deg)") {
        nutriData.style.opacity = .1;
        showBtn.style.transform = 'rotate(0deg)';

        setTimeout(function() {
          nutriData.style.display = "none";
        }, 200);
      };
    });
  };
}

export { lessonNutriData };
