const unitConversion = () => {
  // convert unit button
  const unitBtn = document.querySelector('.unit-conversion-btn');
  const units = document.querySelectorAll('.unit');

  // ingredients measure quantities
  const ingredientMeasures = document.querySelectorAll('.ingredient-measure');

  let convertedValue = 0;

  // ingredients original measure in metric
  const ingredientQuantities = document.querySelectorAll('.ingredient-quantity');

  let initialValues = []

  if (ingredientQuantities) {
    ingredientQuantities.forEach((quantity) => {
      let quantityNumber = Number.parseFloat(quantity.innerText);
      initialValues.push(quantityNumber);
    });
  };

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
            convertedValue = measureQuantityValue / 28.35;
            measureQuantity.innerText = convertedValue.toFixed(1);
          } else if (measureUnit.innerText == 'oz') {
            measureUnit.innerText = 'g';
            measureQuantity.innerText = initialValues[index] * counter;
            //convertedValue = measureQuantityValue * 28.35;
            //measureQuantity.innerText = Math.round(convertedValue / 2) * 2;

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
              measureQuantity.innerText = initialValues[index] * counter;
              //convertedValue = measureQuantityValue * 284;
              //measureQuantity.innerText = Math.round(convertedValue / 2) * 2;
            } else {
              measureUnit.innerText = 'l';
              measureQuantity.innerText = initialValues[index] * counter;
              //convertedValue = measureQuantityValue / 3.52;
              //measureQuantity.innerText = convertedValue.toFixed(0);
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

        if (measureQuantity) {
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
}

export { unitConversion };
