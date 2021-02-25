const currenciesModal = () => {
  const levelBtn = document.querySelector('#nb-level');
  const levelModal = document.querySelector('#level-modal');

  const starBtn = document.querySelector('#nb-xp');
  const starModal = document.querySelector('#stars-modal');

  const cuukieBtn = document.querySelector('#nb-cuukie');
  const cuukieModal = document.querySelector('#cuukies-modal');

  const dishesBtn = document.querySelector('#nb-dish');
  const dishesModal = document.querySelector('#dishes-modal');

  const openModal = (btn, modal) => {
    if (btn) {
      btn.addEventListener('click', () => {
        modal.style.display = 'block';
      });
    };
  }

  openModal(starBtn, starModal);
  openModal(levelBtn, levelModal);
  openModal(cuukieBtn, cuukieModal);
  openModal(dishesBtn, dishesModal);

  const cuukiesClose = document.querySelector('#cuukies-close-btn');
  const dishesClose = document.querySelector('#dishes-close-btn');
  const levelClose = document.querySelector('#level-close-btn');
  const starsClose = document.querySelector('#stars-close-btn');

  const closeModal = (btn, modal) => {
    if (btn) {
      btn.addEventListener('click', () => {
        modal.style.display = 'none';
      });
    };
  }

  closeModal(cuukiesClose, cuukieModal);
  closeModal(levelClose, levelModal);
  closeModal(starsClose, starModal);
  closeModal(dishesClose, dishesModal);
}

export { currenciesModal };
