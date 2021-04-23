const userSkill = () => {
  const userSkillBtns = document.querySelectorAll('.invisible-skill-btn');
  const skillVideos = document.querySelectorAll('.skillVideo');

  if (userSkillBtns) {
    userSkillBtns.forEach((btn) => {
      let video = document.querySelector(`.${btn.id}`);
      video.addEventListener('play', () => {
        btn.click();
      })
    });
  };
};

export { userSkill };
