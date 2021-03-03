const unblockLesson = () => {
  const unblockModal = document.querySelector('#unblockModal');
  const unblockBtn = document.querySelector('#unblockLessonBtn');
  const closeBtn = document.querySelector('#closeUnblockModal');

  if (unblockBtn) {
    unblockBtn.addEventListener('click', () => {
      unblockModal.style.display = "block";
    });

    closeBtn.addEventListener('click', () => {
      unblockModal.style.display = "none";
    });
  };
}

export { unblockLesson };
