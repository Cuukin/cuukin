const unitConversion = () => {

  // Conversion Calcs

  // ml / 284 = cups
  // dl / 2.841 = cups
  // l * 3.52 = cups

  // gram / 28.35 = oz
  // kg * 35.274 = oz

  const unitBtn = document.querySelector('.unit-conversion-btn');
  const units = document.querySelectorAll('.unit');

  const ingredientMeasures = document.querySelectorAll('.ingredient-measure');

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

        index += 1;

        if (measureQuantity) {
          let measureQuantityValue = Number.parseFloat(measureQuantity.innerText);

          if (measureUnit.innerText == 'g') {
            measureUnit.innerText = 'oz';
            measureQuantity.innerText = (measureQuantityValue / 28.35).toFixed(1);
          } else if (measureUnit.innerText == 'oz') {
            measureUnit.innerText = 'g';
            measureQuantity.innerText = Math.round(measureQuantityValue * 28.35);
          } else if (measureUnit.innerText == 'ml') {
            measureUnit.innerText = 'cups';
            measureQuantity.innerText = (measureQuantityValue / 284).toFixed(1);
          } else if (measureUnit.innerText == 'l') {
            measureUnit.innerText = 'cups';
            measureQuantity.innerText = (measureQuantityValue * 3.52).toFixed(1);
          } else if (measureUnit.innerText == 'cups') {
            if (measureQuantityValue < 3.5) {
              measureUnit.innerText = 'ml';
              measureQuantity.innerText = (measureQuantityValue * 284).toFixed(1); //(measureQuantityValue * 284).toFixed(2);
            } else {
              measureUnit.innerText = 'l';
              measureQuantity.innerText = (measureQuantityValue / 3.52).toFixed(1);
            };
          };
        };
      });

    });
  };
}

export { unitConversion };
