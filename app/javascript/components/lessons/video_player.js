const videoPlayer = () => {
  const videoContainers = document.querySelectorAll('.skill-chapter-video');

  if (videoContainers) {
    videoContainers.forEach((container) => {
      let video = container.querySelector('.skillVideo');
      let backwardBtn = container.querySelector('#backward10');
      let forwardBtn = container.querySelector('#forward10');
      backwardBtn.addEventListener('dblclick', (event) => {
        video.currentTime -= 10;
      });
      forwardBtn.addEventListener('dblclick', (event) => {
        video.currentTime += 10;
      });
    });
  };
};

export { videoPlayer };
