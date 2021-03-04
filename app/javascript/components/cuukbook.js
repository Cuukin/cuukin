const cuukbook = () => {
  const unlockedBtn = document.querySelector('#unlockedBtn');
  const unlockedContainer = document.querySelector('#unlockedRecipes');

  const completedBtn = document.querySelector('#completedBtn');
  const completedContainer = document.querySelector('#completedRecipes');

  if (completedContainer) {
    unlockedContainer.style.display = "none";

    if (unlockedContainer.style.display == "none") {
      unlockedBtn.addEventListener('click', () => {
        unlockedBtn.classList.add('recipe-navbar-active');
        completedBtn.classList.remove('recipe-navbar-active');
        unlockedContainer.style.display = "flex";
        completedContainer.style.display = "none";
      });
      completedBtn.addEventListener('click', () => {
        unlockedBtn.classList.remove('recipe-navbar-active');
        completedBtn.classList.add('recipe-navbar-active');
        unlockedContainer.style.display = "none";
        completedContainer.style.display = "flex";
      });
    };
  };
}

export { cuukbook };
