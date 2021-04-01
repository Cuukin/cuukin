const unitConversion = () => {
  // convert unit button
  const unitBtn = document.querySelector('.unit-conversion-btn');
  const units = document.querySelectorAll('.unit');

  // ingredients measure quantities (quantity + unit)
  const ingredientMeasures = document.querySelectorAll('.ingredient-measure');

  let convertedValue = 0;

  // unit conversion function
  if (unitBtn) {
    unitBtn.addEventListener('click', () => {
      let index = -1;

      // button toggle
      units.forEach((unit) => {
        unit.classList.toggle('unitSelected');
      });

      // unit conversion
      ingredientMeasures.forEach((measure) => {
        let measureUnit = measure.querySelector('.ingredient-unit');
        let measureQuantity = measure.querySelector('.ingredient-quantity');

        if (measureQuantity && measureQuantity.innerText != "") {
          index += 1;
          let measureQuantityValue = Number.parseFloat(measureQuantity.innerText);

          if (measureUnit.innerText == 'g') {
            measureUnit.innerText = 'oz';
            convertedValue = measureQuantityValue / 28.35;
            measureQuantity.innerText = convertedValue.toFixed(1);
          } else if (measureUnit.innerText == 'oz') {
            measureUnit.innerText = 'g';
            measureQuantity.innerText = measure.getAttribute('data-ingredient-quantity') * counter;
            //measureQuantity.innerText = initialValues[index] * counter;
          } else if (measureUnit.innerText == 'ml') {
            measureUnit.innerText = 'cups';
            convertedValue = measureQuantityValue / 284;
            measureQuantity.innerText = convertedValue.toFixed(1);
          } else if (measureUnit.innerText == 'l') {
            measureUnit.innerText = 'cups';
            convertedValue = measureQuantityValue * 3.52
            measureQuantity.innerText = convertedValue.toFixed(1);
          } else if (measureUnit.innerText == 'cups') {
            if (measureQuantityValue < 3.5) {
              measureUnit.innerText = 'ml';
              measureQuantity.innerText = measure.getAttribute('data-ingredient-quantity') * counter;
              // measureQuantity.innerText = initialValues[index] * counter;
            } else {
              measureUnit.innerText = 'l';
              measureQuantity.innerText = measure.getAttribute('data-ingredient-quantity') * counter;
              //measureQuantity.innerText = initialValues[index] * counter;
            };
          };
        };
      });
    });
  };

  // edit serving buttons
  const addBtn = document.querySelector('#plusBtn');
  const minusBtn = document.querySelector('#minusBtn');
  const servingNumber = document.querySelector('.serving-paragraph');

  let counter = 1;

  // edit serving function
  if (addBtn) {
    minusBtn.style.visibility = "hidden";

    // more servings function
    addBtn.addEventListener('click', () => {
      minusBtn.style.visibility = "";

      counter += 1;

      if (counter == 4) {
        addBtn.style.visibility = "hidden";
        servingNumber.innerText = `${counter} serving(s)`;
      } else {
        servingNumber.innerText = `${counter} serving(s)`;
      };

      ingredientMeasures.forEach((measure) => {
        let measureQuantity = measure.querySelector('.ingredient-quantity');

        if (measureQuantity && measureQuantity.innerText != "") {
          let measureQuantityValue = Number.parseFloat(measureQuantity.innerText);
          let initialValue = Number.parseFloat(measureQuantityValue) / (counter - 1);

          convertedValue = initialValue * counter;

          if (convertedValue % 1 == 0) {
            measureQuantity.innerText = (initialValue * counter).toFixed(0);
          } else {
            measureQuantity.innerText = (initialValue * counter).toFixed(1);
          };
        };
      });
    });

    // less servings function
    minusBtn.addEventListener('click', () => {
      addBtn.style.visibility = "";

      counter -= 1;

      if (counter == 1) {
        minusBtn.style.visibility = "hidden";
        servingNumber.innerText = `${counter} serving(s)`;
      } else {
        servingNumber.innerText = `${counter} serving(s)`;
      };

      ingredientMeasures.forEach((measure) => {
        let measureQuantity = measure.querySelector('.ingredient-quantity');

        if (measureQuantity && measureQuantity.innerText != "") {
          let measureQuantityValue = Number.parseFloat(measureQuantity.innerText);
          let initialValue = Number.parseFloat(measureQuantityValue) / (counter + 1);

          convertedValue = initialValue * counter;

          if (convertedValue % 1 == 0) {
            measureQuantity.innerText = (initialValue * counter).toFixed(0);
          } else {
            measureQuantity.innerText = (initialValue * counter).toFixed(1);
          };
        };
      });
    });
  };

  // Swap Ingredient
  const swapBtns = document.querySelectorAll('.ingredient-swap-btn');

  if (swapBtns) {
    swapBtns.forEach((btn) => {
      let swapModal = document.getElementById(`${btn.classList[1]}`);

      btn.addEventListener('click', () => {
        swapModal.style.display = "block";
      });

      let ingredients = document.querySelectorAll(`.ingredient-${btn.classList[1]}`);
      let quantities = document.querySelectorAll(`.quantity-${btn.classList[1]}`);
      let units = document.querySelectorAll(`.unit-${btn.classList[1]}`);
      let swapIngredientBtns = swapModal.querySelectorAll('.swap-ingredient');

      swapIngredientBtns.forEach((swapIngredient) => {
        swapIngredient.addEventListener('click', () => {
          swapModal.style.display = "none";

          // Getting it back to metric if it isnt already there!
          const imperialToggle = document.querySelector('#imperial-toggle');
          const metricToggle = document.querySelector('#metric-toggle');

          if (imperialToggle.classList[1] == 'unitSelected') {
            // toggles unit button back to metric
            imperialToggle.classList.toggle('unitSelected');
            metricToggle.classList.toggle('unitSelected');

            // shifts all quantities and units back to database original * counter
            ingredientMeasures.forEach((measure) => {
              let measureQuantity = measure.querySelector('.ingredient-quantity');
              let measureUnit = measure.querySelector('.ingredient-unit');

              let initialQuantity = measure.getAttribute('data-ingredient-quantity');

              if (initialQuantity == "") {
                measureQuantity.innerText = initialQuantity;
              } else {
                measureQuantity.innerText = initialQuantity * counter;
              };

              measureUnit.innerText = measure.getAttribute('data-ingredient-unit');
            });
          };

          ingredients.forEach((ing) => {
            ing.innerText = swapIngredient.id;
          });

          quantities.forEach((quantity) => {
            quantity.innerText = swapIngredient.getAttribute('data-ingredient-quantity') * counter;
          });

          units.forEach((unit) => {
            unit.innerText = swapIngredient.getAttribute('data-ingredient-unit');
          });
        });
      });
    });
  };
};

export { unitConversion };
