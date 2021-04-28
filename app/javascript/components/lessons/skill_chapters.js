const skillChapters = () => {
  const lessonOverview = document.querySelector('.container-lesson-overview');
  const skillsContainer = document.querySelector('.container-skill-chapters');

  if (lessonOverview && skillsContainer) {
    let skillChecks = document.querySelectorAll('.nav-check');
    const skillsBtns = document.querySelectorAll('.open-skill-btn');

    const allCards = document.querySelectorAll('.skill-chapter-card');
    const cardsQuantity = allCards.length;

    let cards = [];
    let firstCard = [];

    let cardIndex = 0;
    let counter = 0;

    const backToOverview = () => {
      lessonOverview.style.display = "block";
      skillsContainer.style.display = "none";
      counter = 0;
      window.scrollTo({top: 0});
      allCards.forEach((card) => {
        card.style.display = "none";
        card.querySelector('.skillVideo').pause();
        let check = skillChecks[card.classList[1]];
        check.querySelector('#skillDone').classList.add('skill-none');
        check.querySelector('#play').classList.remove('skill-none');
      });
    };

    skillsBtns.forEach((btn) => {
      let id = parseInt(btn.id);
      let card = document.getElementById(`skillCard-${id}`);

      btn.addEventListener('click', () => {
        counter = 0;

        window.scrollTo({top: 0});

        lessonOverview.style.display = "none";
        skillsContainer.style.display = "block";
        card.style.display = "block";

        skillChecks[counter].querySelector('#skillDone').classList.remove('skill-none');
        skillChecks[counter].querySelector('#play').classList.add('skill-none');

        cards = Array.prototype.slice.call(document.querySelectorAll('.skill-chapter-card'));
        cardIndex = parseInt(card.classList[1]);
        firstCard = cards.splice(cardIndex, 1);
      });
    });

    const prevBtn = document.querySelector('#prevChapter');
    const nextBtns = document.querySelectorAll('.nextChapter');

    if (cardsQuantity > 1) {
      nextBtns.forEach((nextBtn) => {
        nextBtn.addEventListener('click', () => {
          counter += 1;
          window.scrollTo({top: 0});

          if (counter == 1) {
            firstCard[0].style.display = "none";
            firstCard[0].querySelector('.skillVideo').pause();
            cards[counter - 1].style.display = "block";
            skillChecks[counter].querySelector('#skillDone').classList.remove('skill-none');
            skillChecks[counter].querySelector('#play').classList.add('skill-none');
          } else if (counter == cardsQuantity) {
            backToOverview();
          } else {
            cards[counter - 1].style.display = "block";
            cards[counter - 2].style.display = "none";
            cards[counter - 2].querySelector('.skillVideo').pause();
            skillChecks[counter].querySelector('#skillDone').classList.remove('skill-none');
            skillChecks[counter].querySelector('#play').classList.add('skill-none');
          };
        });
      });

      prevBtn.addEventListener('click', () => {
        counter -= 1;
        window.scrollTo({top: 0});

        if (counter == 0) {
          firstCard[0].style.display = "block";
          cards[counter].style.display = "none";
          cards[counter].querySelector('.skillVideo').pause();
          skillChecks[counter + 1].querySelector('#skillDone').classList.add('skill-none');
          skillChecks[counter + 1].querySelector('#play').classList.remove('skill-none');
        } else if (counter == -1) {
          backToOverview();
        } else {
          cards[counter].style.display = "none";
          cards[counter].querySelector('.skillVideo').pause();
          skillChecks[counter + 1].querySelector('#skillDone').classList.add('skill-none');
          skillChecks[counter + 1].querySelector('#play').classList.remove('skill-none');
          cards[counter - 1].style.display = "block";
        };
      });
    } else {
      prevBtn.addEventListener('click', (event) => {
        backToOverview();
      });
      nextBtns.forEach((nextBtn) => {
        nextBtn.addEventListener('click', (event) => {
          backToOverview();
        });
      });
    };
  };
};

export { skillChapters };
