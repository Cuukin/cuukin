const quizResult = () => {
  const skillsContainer = document.querySelector('.skill-chapters-container');
  const quizContainers = document.querySelectorAll('.quiz-container');

  if (quizContainers) {

    quizContainers.forEach((quiz) => {

      if (quiz.dataset.quizCompleted == 'false') {
        let nbCuukies = document.querySelector('#nb-cuukie p');
        let cuukies = parseInt(nbCuukies.innerText);

        let nbXp = document.querySelector('#nb-xp p');
        let userXp = parseInt(nbXp.innerText);

        let options = quiz.querySelectorAll('.quiz-answer');
        let skip = quiz.querySelector('.skip-quiz-btn');
        let next = quiz.querySelector('.next-card');
        let answer = quiz.querySelector('.quiz-answer-content');
        let correctOption = quiz.querySelector("[data-answer='1']");

        let cuukiesContainer = document.querySelector('.transition-cuukies');
        let xpContainer = document.querySelector('.transition-xp');

        // FUNCTIONS

        const markAsComplete = () => {
          quiz.dataset.quizCompleted = "true";
          quiz.dataset.cardSkippable = "true";
        };

        const spendCuukies = () => {
          setTimeout(function() {
            cuukiesContainer.classList.remove('d-none');
          }, 0);
          setTimeout(function() {
            cuukiesContainer.style.transition = 'all ease-in-out .7s';
            cuukiesContainer.style.opacity = '1';
            cuukiesContainer.style.top = '20px';
          }, 50);
          setTimeout(function() {
            cuukiesContainer.style.opacity = '0';
            cuukiesContainer.style.top = '-10px';
          }, 800);
          setTimeout(function() {
            cuukies = parseInt(nbCuukies.innerText);
            nbCuukies.innerText = cuukies - 1;
            skillsContainer.dataset.userCurrency = cuukies - 1;
          }, 950);
        };

        const gainXp = () => {
          setTimeout(function() {
            xpContainer.classList.remove('d-none');
          }, 0);
          setTimeout(function() {
            xpContainer.style.transition = 'all ease-in-out .7s';
            xpContainer.style.opacity = '1';
            xpContainer.style.top = '20px';
          }, 50);
          setTimeout(function() {
            xpContainer.style.opacity = '0';
            xpContainer.style.top = '-10px';
          }, 800);
          setTimeout(function() {
            userXp = parseInt(nbXp.innerText);
            nbXp.innerText = userXp + 10;
          }, 950);
        };

        // EVENT LISTENERS

        skip.addEventListener('click', (event) => {
          cuukies = parseInt(skillsContainer.dataset.userCurrency);
          if (cuukies >= 1) {
            window.scrollTo({top: 0});
            correctOption.classList.add('correct-answer');
            skip.classList.add('d-none');
            answer.classList.remove('d-none');
            next.classList.remove('d-none');

            options.forEach((option) => {
              option.parentElement.classList.add('unclickable');
            });

            spendCuukies();
            markAsComplete();
          } else {
            skip.classList.add('unclickable');
            let error = '<p class="quiz-error">Not enough Cuukies</p>'
            quiz.querySelector('.quiz-card').insertAdjacentHTML('beforeend', error);
          };
        });

        options.forEach((option) => {
          option.addEventListener('click', (event) => {
            window.scrollTo({top: 0});
            correctOption.classList.add('correct-answer');
            skip.classList.add('d-none');
            answer.classList.remove('d-none');
            next.classList.remove('d-none');

            let error = document.querySelector('.quiz-error');
            if (error) {
              error.remove();
            }

            if (option.dataset.answer == "0") {
              option.classList.add('incorrect-answer'); // if user option is wrong then highlights with red style
            } else {
              gainXp();
            };

            options.forEach((option) => {
              option.parentElement.classList.add('unclickable');
            });

            markAsComplete();
          });
        });
      };

    });

  };
};

export { quizResult };
