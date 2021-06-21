const userSkill = () => {
  const userSkillBtns = document.querySelectorAll('.invisible-skill-btn');

  if (userSkillBtns) {
    userSkillBtns.forEach((btn) => {
      let card = document.querySelector(`[data-card-skill-id='${btn.id}']`);
      let video = document.querySelector(`[data-video-skill-id='${btn.id}']`);
      let tag = document.querySelector(`[data-btn-skill-id='${btn.id}']`);
      let backwardBtns = document.querySelectorAll('.explain-video-control-backward');
      let forwardBtns = document.querySelectorAll('.explain-video-control-forward');

      let nbXp = document.querySelector('#nb-xp p');
      let userXp = parseInt(nbXp.innerText);

      let xpContainer = document.querySelector('.transition-xp');

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

      video.addEventListener('play', () => {
        setTimeout(function() {
          if (!video.paused && card.dataset.videoCompleted == "false") {
            btn.click();
            tag.querySelector('.skill-check').classList.remove('d-none');
            card.dataset.videoCompleted = "true";
            btn.remove();
            gainXp();
          };
        }, 20000);

        backwardBtns.forEach((btn) => {
          if (btn) {
            btn.classList.remove('explain-video-control-backward');
          };
        });
        forwardBtns.forEach((btn) => {
          if (btn) {
            btn.classList.remove('explain-video-control-forward');
          };
        });
      });
    });
  };
};

export { userSkill };
