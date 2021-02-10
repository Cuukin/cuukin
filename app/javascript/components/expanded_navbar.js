const expandedNavbar = () => {
  // Get Elements
  const expandedNB = document.querySelector('.expanded-navbar');
  const userNB = document.querySelector('.container-user-navbar');
  const closeBtn = document.querySelector('#close-btn');
  const openBtn = document.querySelector('#open-btn');

  if (expandedNB) {

    if (openBtn) {
      openBtn.addEventListener('click', () => {
        expandedNB.style.transition = "opacity 850ms cubic-bezier(0.68, -0.6, 0.32, 1.1)";
        expandedNB.style.opacity = "1";
        expandedNB.style.zIndex = "10000";
        expandedNB.style.visibility = "visible";
      });
    };

    if (closeBtn) {
      closeBtn.addEventListener('click', () => {
        expandedNB.style.transition = "opacity 0s linear";
        expandedNB.style.zIndex = "-10000";
        expandedNB.style.opacity = "0";
        expandedNB.style.visibility = "hidden";
      });
    };
  };
}

export { expandedNavbar };
