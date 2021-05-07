const profilePhoto = () => {
  const openEditPhotoBtns = document.querySelectorAll('.openEditPhoto');
  const cancelBtn = document.getElementById('photoCancel');
  const editPhotoModal = document.getElementById('editPhotoModal');

  if (openEditPhotoBtns) {
    openEditPhotoBtns.forEach((btn) => {
      btn.addEventListener('click', () => {
        editPhotoModal.style.display = "block";
      });
    });
  };

  if (cancelBtn) {
    cancelBtn.addEventListener('click', () => {
      editPhotoModal.style.display = "none";
    });
  };

  document.addEventListener('keyup', (event) => {
    if (editPhotoModal && event.key === "Escape") {
      editPhotoModal.style.display = "none";
    };
  });
};

export { profilePhoto };
