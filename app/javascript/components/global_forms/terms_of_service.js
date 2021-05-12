const termsOfService = () => {
  const serviceBtn = document.querySelector('#termsOfServiceBtn');

  if (serviceBtn) {
    const serviceContainer = document.querySelector('#termsOfService');
    const registrationContainer = document.querySelector('#registrationContainer');
    const prevBtn = serviceContainer.querySelector('.btn-back');

    serviceBtn.addEventListener('click', () => {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
      serviceContainer.classList.remove('d-none');
      registrationContainer.classList.add('d-none');
    });

    prevBtn.addEventListener('click', () => {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
      serviceContainer.classList.add('d-none');
      registrationContainer.classList.remove('d-none');
    });
  };
};

export { termsOfService };
