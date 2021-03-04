const cuukbook = () => {
  const unlockedBtn = document.querySelector('#unlockedBtn');
  const unlockedContainer = document.querySelector('#unlockedRecipes');

  const completedBtn = document.querySelector('#completedBtn');
  const completedContainer = document.querySelector('#completedRecipes');

  if (completedContainer) {
    if (unlockedContainer.style.display == "") {
      unlockedBtn.addEventListener('click', () => {
        unlockedBtn.classList.toggle('recipe-navbar-active');
        completedBtn.classList.toggle('recipe-navbar-active');
        unlockedContainer.style.display = "flex";
        completedContainer.style.display = "none";
      });
    };

    if (completedContainer.style.display == "") {
      completedBtn.addEventListener('click', () => {
        unlockedBtn.classList.toggle('recipe-navbar-active');
        completedBtn.classList.toggle('recipe-navbar-active');
        unlockedContainer.style.display = "none";
        completedContainer.style.display = "flex";
      });
    };
  };
}

export { cuukbook };
