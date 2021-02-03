const navbarIcons = () => {
  const nvIcons = document.querySelectorAll('.nv-user-item');

  // const levelIcon = document.querySelector('.nv-level');
  // const xpIcon = document.querySelector('.nv-xp');
  // const cuukieIcon = document.querySelector('.nv-cuukie');
  // const dishIcon = document.querySelector('.nv-dish');

  let current_rotation = 0;

  const rotateIcon = (icon) => {
    icon.addEventListener('click', () => {
      icon.style.transform = 'rotate(' + current_rotation + 'deg)';
    });
  };

  if (nvIcons) {
    nvIcons.forEach(rotateIcon);
  };
};

export { navbarIcons };
