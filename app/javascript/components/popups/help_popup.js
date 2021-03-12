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
}

export { helpPopup };
