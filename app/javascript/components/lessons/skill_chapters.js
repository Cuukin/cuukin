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

    const pauseVideo = (card) => {
      let video = card.querySelector('.skill-video');
      if (video) {
        video.pause();
      };
    };

    const openCard = (card) => {
      window.scrollTo({top: 0});

      // checks[0].querySelector('#skillDone').classList.remove('d-none');
      checks[0].querySelector('#skillProgress').classList.remove('d-none');
      checks[0].querySelector('#skillPlay').classList.add('d-none');

      lessonOverview.classList.add('d-none');
      skillsContainer.classList.remove('d-none');
      card.classList.remove('d-none');

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
        pauseVideo(card);
      });

      checks.forEach((check) => {
        check.querySelector('#skillProgress').classList.add('d-none');
        check.querySelector('#skillDone').classList.add('d-none');
        check.querySelector('#skillPlay').classList.remove('d-none');
      });

      nextChapterBtns.forEach((nextChapter) => {
        nextChapter.style.pointerEvents = "auto";
      });
    };

    const moveToNextCard = () => {
      if (counter == cards.length - 1) {
        backToOverview();
      } else if ((cards[counter].dataset.quizCompleted == 'true') && (cards[counter].dataset.id !== cards[counter + 1].dataset.id)) {
        counter += 1;
        window.scrollTo({top: 0});

        pauseVideo(cards[counter - 1]);
        cards[counter].classList.remove('d-none');
        cards[counter - 1].classList.add('d-none');

        skillsCounter += 1;
        checks[skillsCounter - 1].querySelector('#skillProgress').classList.add('d-none');
        checks[skillsCounter].querySelector('#skillProgress').classList.remove('d-none');
        checks[skillsCounter - 1].querySelector('#skillDone').classList.remove('d-none');
        checks[skillsCounter].querySelector('#skillPlay').classList.add('d-none');
      } else if ((cards[counter].dataset.quizCompleted == 'true') && (cards[counter].dataset.id == cards[counter + 1].dataset.id)) {
        counter += 1;
        window.scrollTo({top: 0});

        pauseVideo(cards[counter - 1]);
        cards[counter].classList.remove('d-none');
        cards[counter - 1].classList.add('d-none');
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

        skillsCounter -= 1;
        checks[skillsCounter].querySelector('#skillProgress').classList.remove('d-none');
        checks[skillsCounter].querySelector('#skillDone').classList.add('d-none');
        // checks[skillsCounter].querySelector('#skillPlay').classList.add('d-none');
        checks[skillsCounter + 1].querySelector('#skillDone').classList.add('d-none');
        checks[skillsCounter + 1].querySelector('#skillProgress').classList.add('d-none');
        checks[skillsCounter + 1].querySelector('#skillPlay').classList.remove('d-none');
      } else {
        counter -= 1;
        window.scrollTo({top: 0});

        pauseVideo(cards[counter + 1]);
        cards[counter].classList.remove('d-none');
        cards[counter + 1].classList.add('d-none');
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
