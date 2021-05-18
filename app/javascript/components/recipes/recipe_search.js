const recipeSearch = () => {
  const completedContainer = document.querySelector('.cuukbook-complete-container');
  const searchedContainer = document.querySelector('.cuukbook-search-container');

  if (completedContainer) {
    const searchForm = document.querySelector('#searchForm')
    const searchInput = searchForm.querySelector('.search-form-control');
    const searchBtn = searchForm.querySelector('#searchBtn');
    const clearBtn = document.querySelector('#clearBtn');

    searchBtn.addEventListener('click', (event) => {
      if (!searchInput.value == "") {
        clearBtn.style.visibility = "visible";
      };
    });

    clearBtn.addEventListener('click', (event) => {
      console.log('AI');
      clearBtn.style.visibility = "hidden";
      searchInput.value = "";
      completedContainer.classList.remove('d-none');
      searchedContainer.classList.add('d-none');
    });
  };
};

export { recipeSearch };
