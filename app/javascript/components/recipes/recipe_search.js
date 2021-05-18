const recipeSearch = () => {
  const cuukbookContainer = document.querySelector('.recipes-container');
  const completedContainer = document.querySelector('.cuukbook-complete-container');
  const searchedContainer = document.querySelector('.cuukbook-search-container');

  if (completedContainer) {
    let searchForm = document.querySelector('#searchForm')
    let searchInput = searchForm.querySelector('.search-form-control');
    let searchBtn = searchForm.querySelector('#searchBtn');

    searchBtn.addEventListener('click', (event) => {
      if (!(searchInput.value == "") && (searchBtn.value == "Search")) {
        searchBtn.value = "Clear";
      } else if (searchBtn.value == "Clear") {
        searchBtn.value = "Search";
        searchInput.value = "";
        completedContainer.classList.remove('d-none');
        searchedContainer.classList.add('d-none');
      };
    });

    // document.addEventListener('keyup', (event) => {
    //   // event.preventDefault();
    //   searchBtn.click();
    //   // searchForm.submit();

    //   if (searchInput.value == "") {
    //     searchedContainer.classList.add('d-none');
    //     completedContainer.classList.remove('d-none');
    //   };
    // });
  };
};

export { recipeSearch };
