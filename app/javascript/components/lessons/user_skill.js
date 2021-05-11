const userSkill = () => {
  const userSkillBtns = document.querySelectorAll('.invisible-skill-btn');
  //const skillVideos = document.querySelectorAll('.skillVideo');

  if (userSkillBtns) {
    userSkillBtns.forEach((btn) => {
      let video = document.querySelector(`.${btn.id}`);
      let tag = document.getElementById(`${video.classList[2]}`);
      let backwardBtns = document.querySelectorAll('.explain-video-control-backward');
      let forwardBtns = document.querySelectorAll('.explain-video-control-forward');
      video.addEventListener('play', () => {
        btn.click();
        tag.querySelector('.skill-check').classList.remove('skill-none');
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
