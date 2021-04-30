const groceryListPage = () => {
  const clearListBtn = document.getElementById('destroyList');

  if (clearListBtn) {
    clearListBtn.addEventListener('click', (event) => {
      let items = document.querySelector('.list-content').querySelectorAll('tr');
      items.forEach((item) => {
        item.style.display = "none";
      });
    });
  };

  const destroyItemBtns = document.querySelectorAll('.destroyItem');

  if (destroyItemBtns) {
    destroyItemBtns.forEach((btn) => {
      let item = document.querySelector(`.${btn.id}`);
      btn.addEventListener('click', (event) => {
        item.style.display = "none";
      });
    });
  };
};

export { groceryListPage };
