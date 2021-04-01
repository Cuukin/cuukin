const unitConversion = () => {
  // convert unit button
  const imperialToggle = document.querySelector('#imperial-toggle');
  const unitBtn = document.querySelector('.unit-conversion-btn');
  const units = document.querySelectorAll('.unit');

  // ingredients measure quantities (quantity + unit)
  const ingredientMeasures = document.querySelectorAll('.ingredient-measure');

  let convertedValue = 0;

  // unit conversion function
  if (unitBtn) {
    unitBtn.addEventListener('click', () => {

      // unit conversion
      ingredientMeasures.forEach((measure) => {
        // initial units based on data set
        let initialUnit = measure.getAttribute('data-ingredient-unit');
        let initialQuantity = measure.getAttribute('data-ingredient-quantity');

        // unit and quantity elements
        let measureUnit = measure.querySelector('.ingredient-unit');
        let measureQuantity = measure.querySelector('.ingredient-quantity');

        if (measureQuantity && measureQuantity.innerText != "") {
          if (imperialToggle.classList[1] == 'unitSelected') {
            measureUnit.innerText = initialUnit;
            measureQuantity.innerText = initialQuantity * counter;
          } else {
            fromMetricToImperial(measureQuantity, measureUnit);
          };
        };
      });

      // button toggle
      units.forEach((unit) => {
        unit.classList.toggle('unitSelected');
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

      let current_rotation = 0;

      btn.addEventListener('click', () => {
        swapModal.style.display = "block";

        current_rotation += 360;
        let icon = btn.querySelector('i');
        icon.style.transition = "transform ease-in-out 0.6s";
        icon.style.transformOrigin = "50% 50%";
        icon.style.transform = 'rotate(' + current_rotation + 'deg)';
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
                let initialQuantityValue = Number.parseFloat(initialQuantity);
                measureQuantity.innerText = initialQuantityValue * counter;
              };

              measureUnit.innerText = measure.getAttribute('data-ingredient-unit');
            });
          };

          current_rotation += 360;
          let icon = btn.querySelector('i');
          icon.style.transition = "transform ease-in-out 0.6s";
          icon.style.transformOrigin = "50% 50%";
          icon.style.transform = 'rotate(' + current_rotation + 'deg)';

          const updateTextWithOpacity = (text, newInfo) => {
            text.style.transition = "opacity ease-in-out 0.2s";
            setTimeout(function() {
              text.style.opacity = 0;
            }, 0);
            setTimeout(function() {
              text.innerText = newInfo;
            }, 300);
            setTimeout(function() {
              text.style.opacity = 1;
            }, 500);
          };

          ingredients.forEach((ing) => {
            let newIng = swapIngredient.id;
            updateTextWithOpacity(ing, newIng);
          });

          quantities.forEach((quantity) => {
            if (swapIngredient.getAttribute('data-ingredient-quantity') == "") {
              let newQuantity = swapIngredient.getAttribute('data-ingredient-quantity');
              updateTextWithOpacity(quantity, newQuantity);
            } else {
              let newQuantity = Number.parseFloat(swapIngredient.getAttribute('data-ingredient-quantity')) * counter;
              updateTextWithOpacity(quantity, newQuantity);
            };
          });

          units.forEach((unit) => {
            let newUnit = swapIngredient.getAttribute('data-ingredient-unit');
            updateTextWithOpacity(unit, newUnit);
          });
        });
      });
    });
  };
};

const fromMetricToImperial = (quantity, unit) => {
  let quantityValue = Number.parseFloat(quantity.innerText);

  if (unit.innerText == 'g') {
    unit.innerText = 'oz';
    quantity.innerText = (quantityValue / 28.35).toFixed(1);
  } else if (unit.innerText == 'ml') {
    unit.innerText = 'cups';
    quantity.innerText = (quantityValue / 284).toFixed(1);
  } else if (unit.innerText == 'l') {
    unit.innerText == 'cups';
    quantity.innerText = (quantityValue * 3.52).toFixed(1);
  };
};

export { unitConversion };
