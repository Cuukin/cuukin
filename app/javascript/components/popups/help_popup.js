const helpPopup = () => {
  const helpModal = document.querySelector('.help-modal');
  const helpBtns = document.querySelectorAll('.btn-help');
  const helpCloseBtn = document.querySelector('.help-modal-close-btn');

  if (helpBtns && helpCloseBtn) {
    helpBtns.forEach((btn) => {
      btn.addEventListener('click', () => {
        helpModal.style.display = "block";
      });
    });

    helpCloseBtn.addEventListener('click', () => {
      helpModal.style.display = "none";
    });
  };

  const newHelpModal = document.querySelector('.help-container');

  if (newHelpModal) {
    const openBtn = document.querySelector('.btn-open-help');
    const closeBtn = newHelpModal.querySelector('.btn-close');

    openBtn.addEventListener('click', () => {
      newHelpModal.style.display = "block";
    });

    closeBtn.addEventListener('click', () => {
      newHelpModal.style.display = "none";
    });
  };
}

export { helpPopup };
