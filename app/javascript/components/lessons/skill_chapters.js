const skillChapters = () => {
  const lessonOverview = document.querySelector('.container-lesson-overview');
  const skillsContainer = document.querySelector('.container-skill-chapters');

  if (lessonOverview && skillsContainer) {
    const btns = document.querySelectorAll('.open-skill-btn'); // open card btns
    const prevBtn = document.querySelector('#prevChapter'); // previous card btn
    const nextBtns = document.querySelectorAll('.next-card'); // next card btns (including quiz)
    const nextChapterBtns = document.querySelectorAll('.next-chapter'); // next chapter btns (excluding quiz)

    const checks = document.querySelectorAll('.nav-check'); // checks navbar

    let cards = document.querySelectorAll('.skill-item'); // cards items
    let related_cards = []; // assign variable to array

    let index = 0;
    let counter = 0;
    let skillsCounter = 0;

    // FUNCTIONS

    const markQuizAsCompleted = (card) => {
      if (card.dataset.quizCompleted == 'true' && card.dataset.cardCurrent == "1") {
        let check = document.querySelector("[data-current='1']");
        let otherQuizQuestions = document.querySelectorAll(`[data-quiz-skill-id='${card.dataset.quizSkillId}']`);
        if (card.dataset.quizIndex == otherQuizQuestions.length - 1) {
          check.querySelector('#skillProgress').classList.add('d-none');
          check.querySelector('#skillNotStarted').classList.add('d-none');
          check.querySelector('#skillCompleted').classList.remove('d-none');
        };
      };
    };

    const pauseVideo = (card) => {
      let video = card.querySelector('.skill-video');
      if (video) {
        video.pause();
      };
    };

    const openCard = (card) => {
      window.scrollTo({top: 0});

      // checks[0].querySelector('#skillCompleted').classList.remove('d-none');
      checks[0].dataset.current = "1";
      checks[0].querySelector('#skillProgress').classList.remove('d-none');
      checks[0].querySelector('#skillNotStarted').classList.add('d-none');

      lessonOverview.classList.add('d-none');
      skillsContainer.classList.remove('d-none');
      card.classList.remove('d-none');
      card.dataset.cardCurrent = "1";

      cards = Array.prototype.slice.call(cards); // turn cards node list into an array
      related_cards = document.querySelectorAll(`[data-id='${card.dataset.id}']`);
      related_cards = Array.prototype.slice.call(related_cards); // turn related cards node list into an array

      related_cards.forEach((related_card) => {
        index = cards.indexOf(related_card);
        cards.splice(index, 1); // remove each related card from that array
      });

      cards = [related_cards, cards].flat(); // reassign cards to an array with related cards at the beggining
    };

    const backToOverview = () => {
      cards = document.querySelectorAll('.skill-item'); // reassign cards to nodelist of skill chapter cards

      counter = 0;
      skillsCounter = 0;
      index = 0;

      window.scrollTo({top: 0});

      lessonOverview.classList.remove('d-none');
      skillsContainer.classList.add('d-none');

      cards.forEach((card) => {
        card.classList.add('d-none');
        card.dataset.cardCurrent = "0";
        pauseVideo(card);
      });

      checks.forEach((check) => {
        check.dataset.current = "0";
        check.querySelector('#skillProgress').classList.add('d-none');
        check.querySelector('#skillCompleted').classList.add('d-none');
        check.querySelector('#skillNotStarted').classList.remove('d-none');
      });

      nextChapterBtns.forEach((nextChapter) => {
        nextChapter.style.pointerEvents = "auto";
      });
    };

    const moveToNextCard = () => {
      if (counter == cards.length - 1) {
        backToOverview();
      } else if ((cards[counter].dataset.cardSkippable == 'true') && (cards[counter].dataset.id !== cards[counter + 1].dataset.id)) {
        counter += 1;
        window.scrollTo({top: 0});

        pauseVideo(cards[counter - 1]);
        cards[counter].classList.remove('d-none');
        cards[counter - 1].classList.add('d-none');
        cards[counter].dataset.cardCurrent = "1";
        cards[counter - 1].dataset.cardCurrent = "0";

        skillsCounter += 1;
        checks[skillsCounter - 1].dataset.current = "0";
        checks[skillsCounter].dataset.current = "1";

        checks[skillsCounter - 1].querySelector('#skillProgress').classList.add('d-none');
        checks[skillsCounter - 1].querySelector('#skillCompleted').classList.remove('d-none');

        checks[skillsCounter].querySelector('#skillNotStarted').classList.add('d-none');
        checks[skillsCounter].querySelector('#skillCompleted').classList.add('d-none');
        checks[skillsCounter].querySelector('#skillProgress').classList.remove('d-none');
      } else if ((cards[counter].dataset.cardSkippable == 'true') && (cards[counter].dataset.id == cards[counter + 1].dataset.id)) {
        counter += 1;
        window.scrollTo({top: 0});

        pauseVideo(cards[counter - 1]);
        cards[counter].classList.remove('d-none');
        cards[counter - 1].classList.add('d-none');

        cards[counter].dataset.cardCurrent = "1";
        cards[counter - 1].dataset.cardCurrent = "0";

        markQuizAsCompleted(cards[counter]);
      };
    };

    const moveToPrevCard = () => {
      if (counter == 0) {
        backToOverview();
      } else if (cards[counter].dataset.id !== cards[counter - 1].dataset.id) {
        counter -= 1;
        window.scrollTo({top: 0});

        pauseVideo(cards[counter + 1]);
        cards[counter].classList.remove('d-none');
        cards[counter + 1].classList.add('d-none');
        cards[counter].dataset.cardCurrent = "1";
        cards[counter + 1].dataset.cardCurrent = "0";

        skillsCounter -= 1;
        checks[skillsCounter].dataset.current = "1";
        checks[skillsCounter + 1].dataset.current = "0";

        checks[skillsCounter].querySelector('#skillProgress').classList.remove('d-none');
        checks[skillsCounter].querySelector('#skillCompleted').classList.add('d-none');
        checks[skillsCounter].querySelector('#skillNotStarted').classList.add('d-none');

        checks[skillsCounter + 1].querySelector('#skillCompleted').classList.add('d-none');
        checks[skillsCounter + 1].querySelector('#skillProgress').classList.add('d-none');
        checks[skillsCounter + 1].querySelector('#skillNotStarted').classList.remove('d-none');

        markQuizAsCompleted(cards[counter]);
      } else {
        counter -= 1;
        window.scrollTo({top: 0});

        pauseVideo(cards[counter + 1]);
        cards[counter].classList.remove('d-none');
        cards[counter + 1].classList.add('d-none');

        cards[counter].dataset.cardCurrent = "1";
        cards[counter + 1].dataset.cardCurrent = "1";

        if (cards[counter].dataset.type == "video") {
          let check = document.querySelector("[data-current='1']");
          check.querySelector('#skillProgress').classList.remove('d-none');
          check.querySelector('#skillCompleted').classList.add('d-none');
        };

        markQuizAsCompleted(cards[counter]);
      };
    };

    // EVENT LISTENERS

    btns.forEach((btn) => {
      let card = document.querySelector(`[data-card-skill-id='${btn.dataset.btnSkillId}']`);
      btn.addEventListener('click', (event) => {
        openCard(card);
      });
    });

    prevBtn.addEventListener('click', (event) => {
      moveToPrevCard();
    });

    nextBtns.forEach((nextBtn) => {
      nextBtn.addEventListener('click', (event) => {
        moveToNextCard();
      });
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === 'ArrowLeft' && lessonOverview.classList.contains('d-none')) {
        moveToPrevCard();
      } else if (event.key === 'ArrowRight' && lessonOverview.classList.contains('d-none')) {
        moveToNextCard();
      };
    });
  };
};

export { skillChapters };
