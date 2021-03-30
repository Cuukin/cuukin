const lessonModal = () => {
  const startLessonModal = document.querySelector('.lesson-modal');
  const startLesson = document.querySelector('#startLesson');

  if (startLesson) {
    const openModal = () => {
      setTimeout(function() {
        startLessonModal.style.display = "block";
      }, 0);

      setTimeout(function() {
        startLessonModal.style.display = "none";
      }, 1600);
    }

    startLesson.addEventListener('click', () => {
      openModal();
    });
  };
}

export { lessonModal };
