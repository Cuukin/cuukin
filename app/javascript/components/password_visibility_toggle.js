const togglePasswordVisibility = () => {
  const passwordToggle = document.querySelector('.toggle-password');
  const password = document.querySelector('.my-password');

  if (passwordToggle) {
    passwordToggle.addEventListener('click', (event) => {
      const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
      password.setAttribute('type', type);
      passwordToggle.classList.toggle('fa-eye-slash');
    });
  }
}

export { togglePasswordVisibility };
