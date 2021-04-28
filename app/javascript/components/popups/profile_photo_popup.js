const profilePhoto = () => {
  const openEditPhotoBtns = document.querySelectorAll('.openEditPhoto');

  if (openEditPhotoBtns) {
    const editPhotoModal = document.getElementById('editPhotoModal');
    const cancelBtn = document.getElementById('photoCancel');
    openEditPhotoBtns.forEach((btn) => {
      btn.addEventListener('click', () => {
        editPhotoModal.style.display = "block";
      });
    });
    cancelBtn.addEventListener('click', () => {
      editPhotoModal.style.display = "none";
    });
  };
};

export { profilePhoto };
