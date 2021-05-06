const toggleFriends = () => {
  const friendsToggle = document.querySelector('.friends-toggle');

  if (friendsToggle) {
    friendsToggle.addEventListener('click', (event) => {
      const items = friendsToggle.querySelectorAll('.feed');
      items.forEach((item) => {
        item.classList.toggle('feedSelected');
      });
    });
  };
};

export { toggleFriends };
