const userSkill = () => {
  const userSkillBtns = document.querySelectorAll('.invisible-skill-btn');
  //const skillVideos = document.querySelectorAll('.skillVideo');

  if (userSkillBtns) {
    userSkillBtns.forEach((btn) => {
      let video = document.querySelector(`.${btn.id}`);
      let tag = document.getElementById(`${video.classList[2]}`);
      video.addEventListener('play', () => {
        btn.click();
        tag.querySelector('.skill-check').classList.remove('skill-none');
      })
    });
  };
};

export { userSkill };
