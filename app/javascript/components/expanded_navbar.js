const expandedNavbar = () => {
  // Get Elements
  const expandedNB = document.querySelector('.expanded-navbar');
  const userNB = document.querySelector('.container-user-navbar');
  const closeBtn = document.querySelector('#close-btn');
  const openBtn = document.querySelector('#open-btn');

  if (expandedNB) {
    expandedNB.style.opacity = "0";

    if (openBtn) {
      openBtn.addEventListener('click', () => {
        expandedNB.style.transition = "opacity 0.4s ease-in";
        expandedNB.style.opacity = "1";
        expandedNB.style.zIndex = "10000";
        userNB.style.zIndex = "0";
      });
    };

    if (closeBtn) {
      closeBtn.addEventListener('click', () => {
        expandedNB.style.transition = "opacity 0s linear";
        expandedNB.style.opacity = "0";
        expandedNB.style.zIndex = "0";
        userNB.style.zIndex = "10000";
      });
    };
  };
}

export { expandedNavbar };
