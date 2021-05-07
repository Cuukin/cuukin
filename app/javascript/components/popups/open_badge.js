const openBadge = () => {
  const badgeBtns = document.querySelectorAll('.badge-btn');

  if (badgeBtns) {
    badgeBtns.forEach((btn) => {
      let badgeModal = document.getElementById(`${btn.classList[2]}`);
      let closeBtn = badgeModal.querySelector('.currency-modal-close-btn');
      let badgeIcons = badgeModal.querySelectorAll('.b-icon');

      btn.addEventListener('click', () => {
        badgeModal.style.display = "block";
        badgeIcons.forEach((icon) => {
          setTimeout(function() {
            icon.style.transition = 'transform ease-in-out 0.3s';
            icon.style.transform += 'rotate(360deg)';
          }, 80);
        });
      });

      closeBtn.addEventListener('click', () => {
        badgeModal.style.display = "none";
      });

      document.addEventListener('keyup', (event) => {
        if (event.key === "Escape") {
          badgeModal.style.display = "none";
        };
      });
    });
  };
};

export { openBadge };
