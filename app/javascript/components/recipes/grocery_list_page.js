const groceryListPage = () => {
  const clearListBtn = document.getElementById('destroyList');
  const copyBtn = document.querySelector('.tag-btn');

  if (clearListBtn) {
    clearListBtn.addEventListener('click', (event) => {
      // let items = document.querySelector('.list-content').querySelectorAll('tr');
      // items.forEach((item) => {
      //   item.style.display = "none";
      // });
      let content = document.querySelector('.list-content');
      content.style.display = "none";
      copyBtn.remove();
    });
  };

  const destroyItemBtns = document.querySelectorAll('.destroyItem');

  if (destroyItemBtns) {
    destroyItemBtns.forEach((btn) => {
      let item = document.querySelector(`.${btn.id}`);

      btn.addEventListener('click', (event) => {
        item.remove();

        let otherItemsOnBadge = document.querySelectorAll(`.${item.classList[1]}`);
        if (otherItemsOnBadge.length == 0) {
          let itemBadge = document.getElementById(item.classList[1]);
          itemBadge.remove();
          let table = document.querySelector(`.table-${itemBadge.id}`);
          table.remove();
        };

        let totalItems = document.querySelectorAll('table');
        if (totalItems.length == 0) {
          copyBtn.remove();
        };
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
    let saveBtn = document.querySelector('#saveDateBtn');
    saveBtn.addEventListener('click', (event) => {
      reminderForm.classList.add('d-none');
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
      copyList.innerText = "Copied to Clipboard";
    });
  };
};

export { groceryListPage };
