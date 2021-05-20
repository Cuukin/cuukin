const timezone = () => {
  const timezoneQuery = document.querySelector('#timezoneQuery');

  if (timezoneQuery) {
    timezoneQuery.value = Intl.DateTimeFormat().resolvedOptions().timeZone;
  };
};

export { timezone };
