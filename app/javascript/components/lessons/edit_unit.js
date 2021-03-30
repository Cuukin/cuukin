const unitConversion = () => {
  // convert unit button
  const unitBtn = document.querySelector('.unit-conversion-btn');
  const units = document.querySelectorAll('.unit');

  // ingredients measure quantities
  const ingredientMeasures = document.querySelectorAll('.ingredient-measure');

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

        if (measureQuantity) {
          index += 1;
          let measureQuantityValue = Number.parseFloat(measureQuantity.innerText);

          if (measureUnit.innerText == 'g') {
            measureUnit.innerText = 'oz';
            measureQuantity.innerText = (measureQuantityValue / 28.35).toFixed(1);
          } else if (measureUnit.innerText == 'oz') {
            measureUnit.innerText = 'g';
            measureQuantity.innerText = (measureQuantityValue * 28.35).toFixed(1);
          } else if (measureUnit.innerText == 'ml') {
            measureUnit.innerText = 'cups';
            measureQuantity.innerText = (measureQuantityValue / 284).toFixed(1);
          } else if (measureUnit.innerText == 'l') {
            measureUnit.innerText = 'cups';
            measureQuantity.innerText = (measureQuantityValue * 3.52).toFixed(1);
          } else if (measureUnit.innerText == 'cups') {
            if (measureQuantityValue < 3.5) {
              measureUnit.innerText = 'ml';
              measureQuantity.innerText = (measureQuantityValue * 284).toFixed(1);
            } else {
              measureUnit.innerText = 'l';
              measureQuantity.innerText = (measureQuantityValue / 3.52).toFixed(1);
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

        if (measureQuantity) {
          let measureQuantityValue = Number.parseFloat(measureQuantity.innerText);
          let initialValue = Number.parseFloat(measureQuantityValue) / (counter - 1);

          if ((initialValue * counter) % 1 == 0) {
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

        if (measureQuantity) {
          let measureQuantityValue = Number.parseFloat(measureQuantity.innerText);
          let initialValue = Number.parseFloat(measureQuantityValue) / (counter + 1);

          if ((initialValue * counter) % 1 == 0) {
            measureQuantity.innerText = (initialValue * counter).toFixed(0);
          } else {
            measureQuantity.innerText = (initialValue * counter).toFixed(1);
          };
        };
      });
    });
  };
}

export { unitConversion };
