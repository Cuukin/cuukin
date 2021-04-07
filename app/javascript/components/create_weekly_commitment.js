const createWeeklyCommitment = () => {
  // const skipBtns = document.querySelectorAll('.skip-btn');
  const continueBtn = document.querySelector('#continueBtn');
  const motivationContainer = document.querySelector('#motivationContainer');
  const commitmentContainer = document.querySelector('#commitmentContainer');

  if (motivationContainer) {
    const nextSlide = (btn) => {
      btn.addEventListener('click', () => {
        motivationContainer.style.display = "none";
        commitmentContainer.style.display = "block";
      });
    };
    //nextSlide(skipBtns[0]);
    nextSlide(continueBtn);
  };
};

export { createWeeklyCommitment };
