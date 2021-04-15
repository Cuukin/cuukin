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
    const closeBtns = newHelpModal.querySelectorAll('.btn-close');

    openBtn.addEventListener('click', () => {
      newHelpModal.style.display = "block";
    });

    const helpCards = newHelpModal.querySelectorAll('.help-card');
    const btnPrev = newHelpModal.querySelector('.btn-prev');
    const btnNext = newHelpModal.querySelector('.btn-forward');

    closeBtns.forEach((btn) => {
      btn.addEventListener('click', () => {
        newHelpModal.style.display = "none";

        helpCards[0].style.display = "flex";
        helpCards[1].style.display = "none";
        helpCards[2].style.display = "none";

        btnPrev.style.visibility = "hidden";
        btnNext.style.visibility = "visible";

        counter = 0;
      });
    });

    let counter = 0;

    btnNext.addEventListener('click', () => {
      counter += 1;
      if (counter < 2) {
        helpCards[counter - 1].style.display = "none";
        helpCards[counter].style.display = "block";
        btnPrev.style.visibility = "visible";
      } else {
        btnNext.style.visibility = "hidden";
        helpCards[counter - 1].style.display = "none";
        helpCards[counter].style.display = "block";
      };
    });

    btnPrev.addEventListener('click', () => {
      counter -= 1;
      if (counter > 0) {
        helpCards[counter + 1].style.display = "none";
        helpCards[counter].style.display = "block";
        btnNext.style.visibility = "visible";
      } else {
        helpCards[counter + 1].style.display = "none";
        helpCards[counter].style.display = "flex";
        btnPrev.style.visibility = "hidden";
      };
    });
  };
}

export { helpPopup };
