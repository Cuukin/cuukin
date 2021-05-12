const lessonAnimation = () => {
  const lessonCompletedContainer = document.querySelector('.lesson-validation-card-animation');
  const lessonAwardsCard = document.querySelector('.lesson-validation-card-awards');
  const lessonBadgesCard = document.querySelector('.lesson-validation-card-badges');

  if (lessonCompletedContainer) {
    const svg = lessonCompletedContainer.querySelector('#Layer_1');
    const icon = lessonCompletedContainer.querySelector('#levelUpIcon');
    const text = lessonCompletedContainer.querySelector('h2');
    setTimeout(function() {
      icon.style.transition = 'all ease-in-out 1s';
      icon.style.opacity = '1';
      icon.style.transform = 'scale(1)';
    }, 1600);
    setTimeout(function() {
      svg.style.transition = 'opacity ease-out 0.8s';
      icon.style.transition = 'all ease-in-out 0.8s';
      text.style.transition = 'all ease-in-out 0.8s';
      svg.style.opacity = '0';
      icon.style.transform = 'scale(.8)';
      icon.style.transform = 'translateY(-40px)';
      text.style.opacity = '1';
    }, 3000);
    setTimeout(function() {
      lessonCompletedContainer.style.transition = 'all ease-in-out 0.8s';
      lessonCompletedContainer.style.opacity = '0';
    }, 6000);
    setTimeout(function() {
      lessonCompletedContainer.style.display = "none";
      lessonAwardsCard.style.display = "flex";
      lessonAwardsCard.style.transition = 'all ease-in-out 0.8s';
      lessonAwardsCard.style.opacity = '1';
    }, 7000);
    setTimeout(function() {
      lessonAwardsCard.style.transition = 'all ease-in-out 0.8s';
      lessonAwardsCard.style.opacity = '0';
    }, 10000);
    setTimeout(function() {
      lessonAwardsCard.style.display = "none";
      lessonBadgesCard.style.display = "flex";
      lessonBadgesCard.style.transition = 'all ease-in-out 0.8s';
      lessonBadgesCard.style.opacity = '1';
    }, 11000);
  };
};

export { lessonAnimation };
