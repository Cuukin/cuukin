const editProfile = () => {
  const editProfileForm = document.querySelector('#editProfileContainer > form');

  if (editProfileForm) {
    const mainContainer = editProfileForm.querySelector('.edit-user-main-container');
    const inputs = mainContainer.querySelectorAll('.editUserInput');
    const submit = editProfileForm.querySelector('#updateProfileBtn');
    const profileCompleted = mainContainer.dataset.userProfileCompleted;
    let formCompleted = profileCompleted;

    const cuukiesContainer = document.querySelector('.transition-cuukies');

    const gainCuukies = () => {
      cuukiesContainer.style.bottom = "0";
      setTimeout(function() {
        cuukiesContainer.classList.remove('d-none');
      }, 0);
      setTimeout(function() {
        cuukiesContainer.style.transition = 'all ease-in-out .7s';
        cuukiesContainer.style.opacity = '1';
        cuukiesContainer.style.bottom = '30px';
      }, 50);
      setTimeout(function() {
        cuukiesContainer.style.opacity = '0';
        cuukiesContainer.style.bottom = '60px';
      }, 800);
    };

    submit.addEventListener('click', (event) => {
      inputs.forEach((input) => {
        if (input.value == "") {
          formCompleted = false;
        } else {
          formCompleted = true;
        };
      });

      if (!(profileCompleted == false) && formCompleted == true) {
        gainCuukies();
        setTimeout(function() {
          editProfileForm.submit();
        }, 1000);
      } else {
        editProfileForm.submit();
      };
    });
  };
};

export { editProfile };
