const editUserRecipe = () => {
  const openBtn = document.querySelector('#openEditUserRecipe');

  if (openBtn) {
    let editModal = document.querySelector('#validateSkippedModal');
    let closeModal = editModal.querySelector('.modal-close-btn');

    let content1 = editModal.querySelector('#recipe-validation-item-1');
    let content2 = editModal.querySelector('#recipe-validation-item-2');

    openBtn.addEventListener('click', (event) => {
      editModal.style.display = "block";
    });

    closeModal.addEventListener('click', (event) => {
      editModal.style.display = "none";
      content2.style.display = "none";
      content1.style.display = "block";
    });

    document.addEventListener('keyup', (event) => {
      if (event.key === "Escape") {
        editModal.style.display = "none";
        content2.style.display = "none";
        content1.style.display = "block";
      };
    });
  };
};

export { editUserRecipe };
