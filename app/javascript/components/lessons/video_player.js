const videoPlayer = () => {
  const videoContainers = document.querySelectorAll('.skill-chapter-video');

  if (videoContainers) {
    videoContainers.forEach((container) => {
      let video = container.querySelector('.skillVideo');
      let backwardBtn = container.querySelector('#backward10');
      let forwardBtn = container.querySelector('#forward10');

      backwardBtn.addEventListener('dblclick', (event) => {
        video.currentTime -= 10;
        if (backwardBtn.classList.contains('explain-video-control-backward')) {
          backwardBtn.classList.remove('explain-video-control-backward');
          forwardBtn.classList.remove('explain-video-control-forward');
        };
      });

      forwardBtn.addEventListener('dblclick', (event) => {
        video.currentTime += 10;
        if (forwardBtn.classList.contains('explain-video-control-forward')) {
          forwardBtn.classList.remove('explain-video-control-forward');
          backwardBtn.classList.remove('explain-video-control-backward');
        };
      });
    });
  };
};

export { videoPlayer };
