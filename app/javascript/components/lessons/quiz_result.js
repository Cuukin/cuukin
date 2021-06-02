const quizResult = () => {
  const quizContainers = document.querySelectorAll('.quiz-container');

  if (quizContainers) {

    quizContainers.forEach((quiz) => {

      if (quiz.dataset.quizCompleted == 'false') {
        let nbCuukie = document.querySelector('#nb-cuukie p');
        let userCuukies = quiz.parentElement;
        let cuukies = parseInt(userCuukies.dataset.userCurrency);

        let nbXp = document.querySelector('#nb-xp p');
        let userXp = parseInt(nbXp.innerText);

        let options = quiz.querySelectorAll('.quiz-answer');
        let skip = quiz.querySelector('.skip-quiz-btn');
        let next = quiz.querySelector('.next-card');
        let answer = quiz.querySelector('.quiz-answer-content');
        let correctOption = quiz.querySelector("[data-answer='1']");

        // functions (spend cuukie or gain xp)

        const spendCuukies = () => {

        };

        const gainXp = () => {

        };

        // event listeners

        skip.addEventListener('click', (event) => {
          if (cuukies >= 1) {
            correctOption.classList.add('correct-answer');
            skip.classList.add('d-none');
            answer.classList.remove('d-none');
            next.classList.remove('d-none');
            quiz.dataset.quizCompleted = "true";
            cuukies -= 1;
            userCuukies.dataset.userCurrency = cuukies;
            nbCuukie.innerText = cuukies;
          } else {
            let error = '<p class="quiz-error">Not enough cuukies</p>'
            quiz.querySelector('.quiz-card').insertAdjacentHTML('beforeend', error);
            skip.classList.add('unclickable');
          };
        });

        options.forEach((option) => {
          option.addEventListener('click', (event) => {
            correctOption.classList.add('correct-answer');
            skip.classList.add('d-none');
            answer.classList.remove('d-none');
            next.classList.remove('d-none');

            if (option.dataset.answer == "0") {
              option.classList.add('incorrect-answer'); // if user option is wrong then highlights with red style
            } else {
              nbXp.innerText = userXp + 10; // if user option is right then updates nb xp
            };

            options.forEach((option) => {
              option.parentElement.classList.add('unclickable');
            });

            quiz.dataset.quizCompleted = "true";
          });
        });
      };

    });

  };
};

export { quizResult };
