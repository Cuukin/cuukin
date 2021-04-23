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

    const backToOverview = (btn) => {
      btn.addEventListener('click', () => {
        lessonOverview.style.display = "block";
        skillsContainer.style.display = "none";
        cards.forEach((card) => {
          card.style.display = "none";
        });
      })
    };

    skillsBtns.forEach((btn) => {
      let id = parseInt(btn.id);
      let card = document.getElementById(`skillCard-${id}`);

      btn.addEventListener('click', () => {
        lessonOverview.style.display = "none";
        skillsContainer.style.display = "block";
        card.style.display = "block";
        counter = parseInt(card.classList[1]);
      });
    });

    if (cardsQuantity > 1) {
      nextBtn.addEventListener('click', () => {
        counter += 1;

        if (counter < cardsQuantity) {
          cards[counter].style.display = "block";
          cards[counter - 1].style.display = "none";
        } else {
          lessonOverview.style.display = "block";
          skillsContainer.style.display = "none";
          cards.forEach((card) => {
            card.style.display = "none";
          });
          counter = 0;
        };
      });

      prevBtn.addEventListener('click', () => {
        if (counter > 0) {
          counter -= 1;
          cards[counter].style.display = "block";
          cards[counter + 1].style.display = "none";
        } else {
          lessonOverview.style.display = "block";
          skillsContainer.style.display = "none";
          cards.forEach((card) => {
            card.style.display = "none";
          });
          counter = 0;
        };
      });
    } else {
      backToOverview(prevBtn);
      backToOverview(nextBtn);
      counter = 0;
    };
  };
};

export { skillChapters };
