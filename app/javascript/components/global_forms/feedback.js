const feedback = () => {
  const feedbackModal = document.querySelector('#feedbackModal');

  if (feedbackModal) {
    const openFeedback = document.querySelector('#openFeedbackBtn');
    const sendFeedback = document.querySelector('#sendFeedbackBtn');
    const feedbackInput = document.querySelector('#feedbackInput');
    const closeFeedback = feedbackModal.querySelector('.modal-close-btn');

    openFeedback.addEventListener('click', (event) => {
      feedbackModal.classList.remove('d-none');
    });

    closeFeedback.addEventListener('click', (event) => {
      feedbackModal.classList.add('d-none');
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === "Escape") {
        feedbackModal.classList.add('d-none');
      };
    });

    feedbackModal.addEventListener('click', (event) => {
      if (event.target == feedbackModal) {
        feedbackModal.classList.add('d-none');
      };
    });

    document.addEventListener('keyup', (event) => {
      if (feedbackInput.value == "") {
        sendFeedback.style.pointerEvents = "none";
        sendFeedback.classList.add('disabled-btn');
        sendFeedback.classList.remove('primary-btn');
      } else {
        sendFeedback.classList.remove('disabled-btn');
        sendFeedback.classList.add('primary-btn');
        sendFeedback.style.pointerEvents = "auto";
      };
    });
  };
};

export { feedback };
