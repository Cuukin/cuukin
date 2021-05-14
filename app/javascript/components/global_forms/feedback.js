const feedback = () => {
  const feedbackModal = document.querySelector('#feedbackModal');

  if (feedbackModal) {
    const openFeedback = document.querySelector('#openFeedbackBtn');
    const sendFeedback = document.querySelector('#sendFeedbackBtn');
    const feedbackInput = document.querySelector('#feedbackInput');
    const closeFeedback = feedbackModal.querySelector('.modal-close-btn');
    const feedbackForm = feedbackModal.querySelector('.feedback-form');
    const feedbackSent = feedbackModal.querySelector('.feedback-sent');

    sendFeedback.style.pointerEvents = "none";

    openFeedback.addEventListener('click', (event) => {
      feedbackModal.classList.remove('d-none');
      feedbackForm.classList.remove('d-none');
      feedbackSent.classList.add('d-none');
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

    sendFeedback.addEventListener('click', (event) => {
      if (feedbackInput.value !== "") {
        feedbackForm.classList.add('d-none');
        feedbackSent.classList.remove('d-none');
      };
    });
  };
};

export { feedback };
