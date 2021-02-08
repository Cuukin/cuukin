const welcome = () => {
  const box = document.querySelector('#welcome-gift');
  const kin = document.querySelector('#cuukin-gray');
  const welcomeKin = document.querySelector('#welcome-kin');
  const welcomeTxt = document.querySelector('#welcome-p');
  const welcomeCongrats = document.querySelector('#welcome-congrats');

  if (box) {
    box.style.transition = "transform 2s ease-in-out";
    kin.style.transition = "transform 2s ease-in-out";

    const moveBox1 = () => {
      setTimeout(function() {
        box.style.transform = "rotate(-40deg)";
      }, 0);
    }

    const moveBox2 = () => {
      setTimeout(function() {
        box.style.transform = "rotate(0deg)";
      }, 0);

      // setTimeout(function() {
      //   welcomeTxt.style.opacity = 1;
      // }, 500);
    }

    const moveBox3 = () => {
      setTimeout(function() {
        box.style.transform = "rotate(-30deg)";
      }, 0);


      // setTimeout(function() {
      //   welcomeCongrats.style.opacity = 1;
      // }, 500);
    }

    const helloKin = () => {
      setTimeout(function() {
        kin.style.transform = "translateY(-104px)";
      }, 0);

      setTimeout(function() {
        welcomeKin.style.transition = "opacity 2s cubic-bezier(0.68, -0.6, 0.32, 1.1)";
        welcomeKin.style.opacity = 1;
      }, 0);
    }

    setTimeout(moveBox1, 0);
    setTimeout(moveBox2, 2000);
    setTimeout(moveBox3, 4000);
    setTimeout(helloKin, 5000);
  }
}

export { welcome };
