const openBadge = () => {
  const badgeBtns = document.querySelectorAll('.badge-btn');

  if (badgeBtns) {
    badgeBtns.forEach((btn) => {
      let badgeModal = document.getElementById(`${btn.classList[2]}`);
      let closeBtn = badgeModal.querySelector('.currency-modal-close-btn');

      btn.addEventListener('click', () => {
        badgeModal.style.display = "block";
      });

      closeBtn.addEventListener('click', () => {
        badgeModal.style.display = "none";
      });
    });
  };
};

export { openBadge };
