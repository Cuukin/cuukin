const unblockLesson = () => {
  const unblockModal = document.querySelector('#unblockModal');
  const unblockBtn = document.querySelector('#unblockLessonBtn');
  const closeBtn = document.querySelector('#closeUnblockModal');

  const openOptionsBtn = document.querySelector('#openUnblockOptionsBtn');
  const unblockOptionsModal = document.querySelector('.unblock-lesson-modal');

  if (openOptionsBtn) {
    openOptionsBtn.addEventListener('click', () => {
      unblockOptionsModal.style.display = "block";
    });
  };

  if (unblockBtn) {
    unblockBtn.addEventListener('click', () => {
      unblockModal.style.display = "block";
      unblockOptionsModal.style.display = "none";
    });

    closeBtn.addEventListener('click', () => {
      unblockModal.style.display = "none";
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === "Escape") {
        unblockModal.style.display = "none";
      };
    });
  };
}

export { unblockLesson };
