const skillChapters = () => {
  const lessonOverview = document.querySelector('.container-lesson-overview');
  const skillsContainer = document.querySelector('.container-skill-chapters');

  if (lessonOverview && skillsContainer) {
    let skillChecks = document.querySelectorAll('.nav-check');
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
          let check = skillChecks[card.classList[1]];
          check.querySelector('#skillDone').style.display = "none";
          check.querySelector('#play').style.display = "initial";
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
        let check = skillChecks[counter];
        check.querySelector('#skillDone').style.display = "initial";
        check.querySelector('#play').style.display = "none";

        // if (counter > 0) {
        //   skillChecks = Array.prototype.slice.call(skillChecks);
        //   let checks = skillChecks.slice(0, counter + 1);
        //   console.log(counter);
        //   console.log(checks);
        //   checks.forEach((check) => {
        //     check.querySelector('#done').style.display = "block";
        //     check.querySelector('#play').style.display = "none";
        //   });
        // } else {
        //   let check = skillChecks[counter];
        //   check.querySelector('#done').style.display = "block";
        //   check.querySelector('#play').style.display = "none";
        // }
      });
    });

    if (cardsQuantity > 1) {
      nextBtn.addEventListener('click', () => {
        counter += 1;

        if (counter < cardsQuantity) {
          cards[counter].style.display = "block";
          cards[counter - 1].style.display = "none";
          let check = skillChecks[counter];
          check.querySelector('#skillDone').style.display = "initial";
          check.querySelector('#play').style.display = "none";
        } else {
          lessonOverview.style.display = "block";
          skillsContainer.style.display = "none";
          cards.forEach((card) => {
            card.style.display = "none";
            let check = skillChecks[card.classList[1]];
            check.querySelector('#skillDone').style.display = "none";
            check.querySelector('#play').style.display = "initial";
          });
          counter = 0;
        };
      });

      prevBtn.addEventListener('click', () => {
        if (counter > 0) {
          counter -= 1;
          cards[counter].style.display = "block";
          cards[counter + 1].style.display = "none";
          let check = skillChecks[counter];
          check.querySelector('#skillDone').style.display = "initial";
          check.querySelector('#play').style.display = "none";
        } else {
          lessonOverview.style.display = "block";
          skillsContainer.style.display = "none";
          cards.forEach((card) => {
            card.style.display = "none";
            let check = skillChecks[card.classList[1]];
            check.querySelector('#skillDone').style.display = "none";
            check.querySelector('#play').style.display = "initial";
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
