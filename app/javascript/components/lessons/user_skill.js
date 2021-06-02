const userSkill = () => {
  const userSkillBtns = document.querySelectorAll('.invisible-skill-btn');

  if (userSkillBtns) {
    userSkillBtns.forEach((btn) => {
      let video = document.querySelector(`[data-video-skill-id='${btn.id}']`);
      let tag = document.querySelector(`[data-btn-skill-id='${btn.id}']`);
      let backwardBtns = document.querySelectorAll('.explain-video-control-backward');
      let forwardBtns = document.querySelectorAll('.explain-video-control-forward');

      video.addEventListener('play', () => {
        btn.click();
        tag.querySelector('.skill-check').classList.remove('d-none');

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
