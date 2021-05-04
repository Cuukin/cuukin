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

  const openInfoBtns = document.querySelectorAll('.openInfo');

  if (openInfoBtns) {
    openInfoBtns.forEach((btn) => {
      let infoModal = document.querySelector(`.${btn.id}`);
      btn.addEventListener('click', (event) => {
        infoModal.style.display = "block";
      });
      let closeBtn = infoModal.querySelector('.currency-modal-close-btn');
      closeBtn.addEventListener('click', (event) => {
        infoModal.style.display = "none";
      });
    });
  };

  const editDate = document.querySelector('#editDateBtn');

  if (editDate) {
    let reminderForm = document.querySelector('.reminder-right');
    editDate.addEventListener('click', (event) => {
      reminderForm.classList.remove('d-none');
    });
  };

  const copyList = document.querySelector('.tag-btn');
  if (copyList) {
    copyList.addEventListener('click', (event) => {
      const el = document.createElement('textarea');
      let strs = document.querySelectorAll('tr');
      strs.forEach((str) => {
        if (str.style.display === 'none') {
        } else {
          el.value = `${el.value}\n${str.innerText}`
        };
      });
      document.body.appendChild(el);
      el.select();
      document.execCommand('copy');
      document.body.removeChild(el);
    });
  };
};

export { groceryListPage };
