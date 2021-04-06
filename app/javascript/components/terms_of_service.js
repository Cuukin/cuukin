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
      serviceContainer.style.display = "block";
      registrationContainer.style.display = "none";
    });

    prevBtn.addEventListener('click', () => {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
      serviceContainer.style.display = "none";
      registrationContainer.style.display = "block";
    });
  };
};

export { termsOfService };
