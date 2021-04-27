const lessonReferrers = () => {
  const prevRecipe = document.querySelector('#prevRecipe');
  const validation = document.querySelector('.lesson-overview-validation');

  if (prevRecipe && validation) {
    const top = validation.offsetTop;
    window.scrollTo({top: document.body.scrollHeight});
  };
};

export { lessonReferrers };
