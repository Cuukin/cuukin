const profilePhoto = () => {
  const openEditPhotoBtns = document.querySelectorAll('.openEditPhoto');
  const cancelBtn = document.getElementById('photoCancel');

  if (openEditPhotoBtns) {
    const editPhotoModal = document.getElementById('editPhotoModal');
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
};

export { profilePhoto };
