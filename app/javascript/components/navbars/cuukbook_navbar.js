const cuukbookNavbar = () => {
  const unlockedBtn = document.querySelector('#unlockedBtn');
  const unlockedContainer = document.querySelector('#unlockedRecipes');

  const completedBtn = document.querySelector('#completedBtn');
  const completedContainer = document.querySelector('#completedRecipes');

  if (completedContainer) {
    if (unlockedContainer.classList.contains('d-none')) {
      unlockedBtn.addEventListener('click', () => {
        unlockedBtn.classList.add('recipe-navbar-active');
        completedBtn.classList.remove('recipe-navbar-active');
        unlockedContainer.classList.remove('d-none');
        completedContainer.classList.add('d-none');
      });
      completedBtn.addEventListener('click', () => {
        unlockedBtn.classList.remove('recipe-navbar-active');
        completedBtn.classList.add('recipe-navbar-active');
        unlockedContainer.classList.add('d-none');
        completedContainer.classList.remove('d-none');
      });
    };
  };
}

export { cuukbookNavbar };
