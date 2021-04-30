const groceryListItem = () => {
  const addToGroceryBtn = document.querySelector('#addToGrocery');
  const addGroceryItemBtns = document.querySelectorAll('.add-grocery-list-item');

  if (addToGroceryBtn) {
    addToGroceryBtn.addEventListener('click', (event) => {
      addGroceryItemBtns.forEach((btn) => {
        btn.click();
      });
      addToGroceryBtn.style.pointerEvents = "none";
      addToGroceryBtn.classList.remove('secondary-btn');
      addToGroceryBtn.classList.add('disabled-btn');
      addToGroceryBtn.innerText = 'Added to Grocery List';
    });
  };
};

export { groceryListItem };
