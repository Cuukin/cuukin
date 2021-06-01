const skillChapters = () => {
  const lessonOverview = document.querySelector('.container-lesson-overview');
  const skillsContainer = document.querySelector('.container-skill-chapters');

  if (lessonOverview && skillsContainer) {
    const btns = document.querySelectorAll('.open-skill-btn');
    let cards = document.querySelectorAll('.skill-chapter-card');
    const checks = document.querySelectorAll('.nav-check');

    let counter = 0;

    const openCard = (card) => {
      counter = 0;
      window.scrollTo({top: 0});
      lessonOverview.classList.add('d-none');
      skillsContainer.classList.remove('d-none');
      card.classList.remove('d-none');
      checks[counter].querySelector('#skillDone').classList.remove('d-none');
      checks[counter].querySelector('#skillPlay').classList.add('d-none');
      cards = Array.prototype.slice.call(cards); // turn cards node list into an array
      cards.splice(parseInt(card.dataset.cardIndex), 1); // remove card from that array
      cards = [card, cards].flat(); // reassign cards to an array with card at the beggining
    };

    const backToOverview = () => {
      counter = 0;
      window.scrollTo({top: 0});
      lessonOverview.classList.remove('d-none');
      skillsContainer.classList.add('d-none');

      cards.forEach((card) => {
        card.classList.add('d-none');
        card.querySelector('.skill-video').pause();
      });

      checks.forEach((check) => {
        check.querySelector('#skillDone').classList.add('d-none');
        check.querySelector('#skillPlay').classList.remove('d-none');
      });

      cards = document.querySelectorAll('.skill-chapter-card'); // reassign cards to nodelist of skill chapter cards
    };

    const moveToNextCard = () => {
      counter += 1;
      window.scrollTo({top: 0});

      if (counter == cards.length) {
        backToOverview();
      } else {
        cards[counter].classList.remove('d-none');
        cards[counter - 1].classList.add('d-none');
        cards[counter - 1].querySelector('.skill-video').pause();
        checks[counter].querySelector('#skillDone').classList.remove('d-none');
        checks[counter].querySelector('#skillPlay').classList.add('d-none');
      };
    };

    const moveToPrevCard = () => {
      counter -= 1;
      window.scrollTo({top: 0});

      if (counter == -1) {
        backToOverview();
      } else {
        cards[counter].classList.remove('d-none');
        cards[counter + 1].classList.add('d-none');
        cards[counter + 1].querySelector('.skill-video').pause();
        checks[counter].querySelector('#skillDone').classList.remove('d-none');
        checks[counter].querySelector('#skillPlay').classList.add('d-none');
        checks[counter + 1].querySelector('#skillDone').classList.add('d-none');
        checks[counter + 1].querySelector('#skillPlay').classList.remove('d-none');
      };
    };

    btns.forEach((btn) => {
      let card = document.querySelector(`[data-card-skill-id='${btn.dataset.btnSkillId}']`);
      btn.addEventListener('click', (event) => {
        openCard(card);
      });
    });

    const prevBtn = document.querySelector('#prevChapter');
    const nextBtns = document.querySelectorAll('.nextChapter');

    prevBtn.addEventListener('click', (event) => {
      moveToPrevCard();
    });

    nextBtns.forEach((nextBtn) => {
      nextBtn.addEventListener('click', (event) => {
        moveToNextCard();
      });
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === 'ArrowLeft') {
        moveToPrevCard();
      } else if (event.key === 'ArrowRight') {
        moveToNextCard();
      };
    });
  };
};

export { skillChapters };
