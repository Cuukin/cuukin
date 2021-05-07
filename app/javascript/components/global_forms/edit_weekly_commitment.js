const editWeeklyCommitment = () => {
  const editCommitmentBtn = document.querySelector('#edit-commitment-btn');
  const editCommitmentContainer = document.querySelector('.edit-commitment-container');
  const editUserMainContainer = document.querySelector('.edit-user-main-container');
  const editUserBtns = document.querySelector('.edit-user-btns');

  if (editCommitmentBtn) {
    editCommitmentBtn.addEventListener('click', () => {
      editCommitmentContainer.style.display = "block";
      editUserMainContainer.style.display = "none";
      editUserBtns.style.display = "none";
    });
  };
};

export { editWeeklyCommitment };
