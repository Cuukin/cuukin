const userSkill = () => {
  const userSkillBtns = document.querySelectorAll('.invisible-skill-btn');

  if (userSkillBtns) {
    userSkillBtns.forEach((btn) => {
      let card = document.querySelector(`[data-card-skill-id='${btn.id}']`);
      let video = document.querySelector(`[data-video-skill-id='${btn.id}']`);
      let tag = document.querySelector(`[data-btn-skill-id='${btn.id}']`);
      let backwardBtns = document.querySelectorAll('.explain-video-control-backward');
      let forwardBtns = document.querySelectorAll('.explain-video-control-forward');

      video.addEventListener('play', () => {
        setTimeout(function() {
          if (!video.paused) {
            btn.click();
            tag.querySelector('.skill-check').classList.remove('d-none');
            card.dataset.videoCompleted = "true";
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
