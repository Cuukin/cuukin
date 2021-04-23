const skillChapters = () => {
  const lessonOverview = document.querySelector('.container-lesson-overview');

  if (lessonOverview) {
    const skillsContainer = document.querySelector('.container-skill-chapters');
    const skillsBtns = document.querySelectorAll('.open-skill-btn');

    const prevBtn = document.querySelector('#prevChapter');
    const nextBtn = document.querySelector('#nextChapter');

    const cards = document.querySelectorAll('.skill-chapter-card');
    const cardsQuantity = cards.length;

    let counter = 0;

    skillsBtns.forEach((btn) => {
      let id = btn.id;
      let card = document.getElementById(`skillCard-${id}`);

      let otherCards = [];
      cards.forEach((card) => {
        if (card.id !== `skillCard-${id}`) {
          otherCards.push(card);
        };
      });

      btn.addEventListener('click', () => {
        counter = 0;
        lessonOverview.style.display = "none";
        skillsContainer.style.display = "block";
        card.style.display = "block";
      });

      if (cardsQuantity > 1) {
        nextBtn.addEventListener('click', () => {
          counter += 1;
          card.style.display = "none";
          otherCards[counter - 1].style.display = "block";
        });
      } else {
        const backToOverview = (btn) => {
          btn.addEventListener('click', () => {
            lessonOverview.style.display = "block";
            skillsContainer.style.display = "none";
            cards.forEach((card) => {
              card.style.display = "none";
            });
          })
        };
        backToOverview(prevBtn);
        backToOverview(nextBtn);
      };

    });
  };
};

export { skillChapters };
