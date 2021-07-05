const onboardingSegmentationForm = () => {
  const skipBtns = document.querySelectorAll('.skipBtn');
  const continueBtns = document.querySelectorAll('.continueBtn');
  const commitmentContainer = document.querySelector('.commitment-container');

  if (commitmentContainer) {
    const editContainers = commitmentContainer.querySelectorAll('.form-inputs');

    const nextSlide = (btns) => {
      let counter = 0;
      btns.forEach((btn) => {
        btn.addEventListener('click', () => {
          counter += 1;
          editContainers[counter - 1].classList.add('d-none');
          editContainers[counter].classList.remove('d-none');
        });
      });
    };

    // nextSlide(skipBtns);
    nextSlide(continueBtns);
  };
};

export { onboardingSegmentationForm };
