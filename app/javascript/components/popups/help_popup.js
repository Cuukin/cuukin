const helpPopup = () => {
  const helpModal = document.querySelector('.help-modal');
  const helpBtns = document.querySelectorAll('.btn-help');
  const closeBtn = document.querySelector('.help-modal-close-btn');

  if (helpBtns) {
    helpBtns.forEach((btn) => {
      btn.addEventListener('click', () => {
        helpModal.style.display = "block";
      });
    });

    closeBtn.addEventListener('click', () => {
      helpModal.style.display = "none";
    });
  };
}

export { helpPopup };
