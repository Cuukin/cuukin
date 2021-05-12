const helpPopup = () => {
  const newHelpModal = document.querySelector('.help-container');

  if (newHelpModal) {
    const openBtn = document.querySelector(`#${newHelpModal.id}Btn`);
    const closeBtns = newHelpModal.querySelectorAll('.btn-close');

    openBtn.addEventListener('click', () => {
      newHelpModal.classList.remove('d-none');
      helpCards[0].classList.remove('d-none');
    });

    const helpCards = newHelpModal.querySelectorAll('.help-card');
    const btnPrev = newHelpModal.querySelector('.btn-prev');
    const btnNext = newHelpModal.querySelector('.btn-forward');

    closeBtns.forEach((btn) => {
      btn.addEventListener('click', () => {
        newHelpModal.classList.add('d-none');
        helpCards[1].classList.add('d-none');
        helpCards[1].classList.add('d-none');

        btnPrev.style.visibility = "hidden";
        btnNext.style.visibility = "visible";

        counter = 0;
      });
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === "Escape") {
        newHelpModal.classList.add('d-none');
        helpCards[1].classList.add('d-none');
        helpCards[1].classList.add('d-none');

        btnPrev.style.visibility = "hidden";
        btnNext.style.visibility = "visible";

        counter = 0;
      };
    });

    newHelpModal.addEventListener('click', (event) => {
      if (event.target == newHelpModal) {
        newHelpModal.classList.add('d-none');
        helpCards[1].classList.add('d-none');
        helpCards[1].classList.add('d-none');

        btnPrev.style.visibility = "hidden";
        btnNext.style.visibility = "visible";

        counter = 0;
      };
    });

    let counter = 0;

    btnNext.addEventListener('click', () => {
      counter += 1;
      if (counter == 1) {
        helpCards[counter - 1].classList.add('d-none');
        helpCards[counter].classList.remove('d-none');
        btnPrev.style.visibility = "visible";
        btnNext.style.visibility = "hidden";
      };
    });

    btnPrev.addEventListener('click', () => {
      counter -= 1;
      if (counter == 0) {
        helpCards[counter + 1].classList.add('d-none');
        helpCards[counter].classList.remove('d-none');
        btnNext.style.visibility = "visible";
        btnPrev.style.visibility = "hidden";
      };
    });
  };
}

export { helpPopup };
