const quizResult = () => {
  const quizContainers = document.querySelectorAll('.quiz-container');

  if (quizContainers) {

    quizContainers.forEach((quiz) => {

      if (quiz.dataset.quizCompleted == 'false') {
        let options = quiz.querySelectorAll('.quiz-answer');
        let skip = quiz.querySelector('.skip-quiz');
        let next = quiz.querySelector('.next-card');
        let answer = quiz.querySelector('.quiz-answer-content');
        let correctOption = quiz.querySelector("[data-answer='0']");

        options.forEach((option) => {
          option.addEventListener('click', (event) => {
            correctOption.classList.add('correct-answer');
            skip.classList.add('d-none');
            answer.classList.remove('d-none');
            next.classList.remove('d-none');

            if (option.dataset.answer == "0") {
              option.classList.add('incorrect-answer');
            };

            options.forEach((option) => {
              option.parentElement.classList.add('unclickable');
            });
          });
        });
      };

    });

  };
};

export { quizResult };
