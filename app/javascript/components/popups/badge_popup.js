const badgePopup = () => {
  const awardIcon = document.querySelector('#badge-icon');
  const badgeIcons = document.querySelectorAll('.badge-icon');

  if (awardIcon) {
      setTimeout(function() {
        awardIcon.style.transition = 'opacity ease-in-out 0.6s';
        awardIcon.style.opacity = '1';
      }, 70);
      setTimeout(function() {
        awardIcon.style.transition = 'transform ease-in-out 0.4s';
        awardIcon.style.transform += 'rotate(360deg)';
      }, 90);
      setTimeout(function() {
        awardIcon.style.transition = 'transform ease-in-out 0.4s';
        awardIcon.style.transform += 'rotate(360deg)';
      }, 530);

    awardIcon.addEventListener('click', () => {
      awardIcon.style.transform += 'rotate(360deg)';
    });
  };

  if (badgeIcons) {
    badgeIcons.forEach((badgeIcon) => {
        setTimeout(function() {
          badgeIcon.style.transition = 'opacity ease-in-out 0.6s';
          badgeIcon.style.opacity = '1';
        }, 70);
        setTimeout(function() {
          badgeIcon.style.transition = 'transform ease-in-out 0.4s';
          badgeIcon.style.transform += 'rotate(360deg)';
        }, 90);
    });
  };
}

export { badgePopup };
