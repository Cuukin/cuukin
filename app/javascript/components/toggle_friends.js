const toggleFriends = () => {
  const toggleBtn = document.querySelector('.friends-toggle');
  const friendsFeed = document.querySelector('.friends-feed-container');
  const publicFeed = document.querySelector('.public-feed-container');

  if (toggleBtn) {
    toggleBtn.addEventListener('click', (event) => {
      const friendsToggle = document.getElementById('friendsToggle');
      const publicToggle = document.getElementById('publicToggle');

      if (friendsToggle.classList[1] == 'feedSelected') {
        publicFeed.classList.toggle('d-none');
        friendsFeed.classList.toggle('d-none');
      } else {
        publicFeed.classList.toggle('d-none');
        friendsFeed.classList.toggle('d-none');
      };

      const items = toggleBtn.querySelectorAll('.feed');

      items.forEach((item) => {
        item.classList.toggle('feedSelected');
      });
    });
  };
};

export { toggleFriends };
