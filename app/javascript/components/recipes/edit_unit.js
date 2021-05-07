const unitConversion = () => {
  // GENERAL VARIABLES
  // REUSED ALL OVER THE FUNCTION

  // unit btns
  const imperialToggle = document.querySelector('#imperial-toggle');
  const metricToggle = document.querySelector('#metric-toggle');
  const unitBtn = document.querySelector('.unit-conversion-btn');

  // serving buttons
  const addBtn = document.querySelector('#plusBtn');
  const minusBtn = document.querySelector('#minusBtn');
  const servingNumber = document.querySelector('.serving-paragraph');

  // swap btns
  const swapBtns = document.querySelectorAll('.ingredient-swap-btn');

  // ingredients measures (inside is quantity + unit)
  const ingredientMeasures = document.querySelectorAll('.ingredient-measure');

  // counter for serving and unit
  let counter = 1;


  // UNIT CONVERSION
  if (unitBtn) {
    unitBtn.addEventListener('click', () => {
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

            let quantityInput = document.getElementById(`quantityInput-${measure.classList[2]}`);
            let unitInput = document.getElementById(`unitInput-${measure.classList[2]}`);

            if (quantityInput != null && unitInput != null) {
              unitInput.value = initialUnit;
              quantityInput.value = initialQuantity * counter;
            };
          } else {
            fromMetricToImperial(measureQuantity, measureUnit);
          };
        };
      });

      // button toggle
      const units = document.querySelectorAll('.unit');
      units.forEach((unit) => {
        unit.classList.toggle('unitSelected');
      });
    });
  };

  // EDIT SERVING
  if (addBtn) {
    //minusBtn.style.visibility = "hidden";
    minusBtn.classList.add('disabled');

    addBtn.addEventListener('click', () => {
      //minusBtn.style.visibility = "";
      minusBtn.classList.remove('disabled');
      minusBtn.style.pointerEvents = "auto";

      counter += 1;

      if (counter == 4) {
        //addBtn.style.visibility = "hidden";
        addBtn.classList.add('disabled');
        addBtn.style.pointerEvents = "none";
        servingNumber.innerText = `${counter}`;
      } else {
        servingNumber.innerText = `${counter}`;
      };

      ingredientMeasures.forEach((measure) => {
        let measureQuantity = measure.querySelector('.ingredient-quantity');

        if (measureQuantity && measureQuantity.innerText != "") {
          let quantityValue = Number.parseFloat(measureQuantity.innerText);
          let initialQuantity = quantityValue / (counter - 1);

          let convertedQuantity = initialQuantity * counter;

          let quantityInput = document.getElementById(`quantityInput-${measure.classList[2]}`);

          if (convertedQuantity % 1 == 0) {
            measureQuantity.innerText = (initialQuantity * counter).toFixed(0);

            if (quantityInput != null) {
              quantityInput.value = (initialQuantity * counter).toFixed(0);
            };
          } else {
            measureQuantity.innerText = (initialQuantity * counter).toFixed(1);

            if (quantityInput != null) {
              quantityInput.value = (initialQuantity * counter).toFixed(1);
            };
          };
        };
      });
    });

    minusBtn.addEventListener('click', () => {
      //addBtn.style.visibility = "";
      addBtn.classList.remove('disabled');
      addBtn.style.pointerEvents = "auto";

      counter -= 1;

      if (counter == 1) {
        //minusBtn.style.visibility = "hidden";
        minusBtn.classList.add('disabled');
        minusBtn.style.pointerEvents = "none";
        servingNumber.innerText = `${counter}`;
      } else {
        servingNumber.innerText = `${counter}`;
      };

      ingredientMeasures.forEach((measure) => {
        let measureQuantity = measure.querySelector('.ingredient-quantity');

        if (measureQuantity && measureQuantity.innerText != "") {
          let quantityValue = Number.parseFloat(measureQuantity.innerText);
          let initialQuantity = quantityValue / (counter + 1);

          let convertedValue = initialQuantity * counter;

          let quantityInput = document.getElementById(`quantityInput-${measure.classList[2]}`);

          if (convertedValue % 1 == 0) {
            measureQuantity.innerText = (initialQuantity * counter).toFixed(0);

            if (quantityInput != null) {
              quantityInput.value = (initialQuantity * counter).toFixed(0);
            };
          } else {
            measureQuantity.innerText = (initialQuantity * counter).toFixed(1);

            if (quantityInput != null) {
              quantityInput.value = (initialQuantity * counter).toFixed(1);
            };
          };
        };
      });
    });
  };

  // SWAP INGREDIENT
  if (swapBtns) {
    swapBtns.forEach((btn) => {
      let current_rotation = 0;

      // measure item (contains both quantity and unit)
      let measureItem = document.querySelector(`.measure-${btn.classList[1]}`);

      // modal with swap options
      // and all ingredient swap options from that modal
      let swapModal = document.getElementById(`${btn.classList[1]}`);
      let swapIngredientBtns = swapModal.querySelectorAll('.swap-ingredient');

      // placeholders from overview and recipe method
      // that connects to the ingredient being swapped
      let ingredients = document.querySelectorAll(`.ingredient-${btn.classList[1]}`);
      let quantities = document.querySelectorAll(`.quantity-${btn.classList[1]}`);
      let units = document.querySelectorAll(`.unit-${btn.classList[1]}`);

      btn.addEventListener('click', () => {
        swapModal.style.display = "block"; // open modal from that button

        // rotate icon from that btn
        current_rotation += 360;
        let icon = btn.querySelector('i');
        icon.style.transition = "transform ease-in-out 0.6s";
        icon.style.transformOrigin = "50% 50%";
        icon.style.transform = 'rotate(' + current_rotation + 'deg)';
      });

      document.addEventListener('keyup', (event) => {
        if (event.key === "Escape") {
          swapModal.style.display = "none";
        };
      });

      swapIngredientBtns.forEach((swapIngredient) => {

        swapIngredient.addEventListener('click', () => {
          swapModal.style.display = "none";

          // get information from ingredient swap
          let ingredientUnit = swapIngredient.getAttribute('data-ingredient-unit');
          let ingredientQuantity = swapIngredient.getAttribute('data-ingredient-quantity');

          current_rotation += 360;
          let icon = btn.querySelector('i');
          icon.style.transition = "transform ease-in-out 0.6s";
          icon.style.transformOrigin = "50% 50%";
          icon.style.transform = 'rotate(' + current_rotation + 'deg)';

          // check if its imperial
          if (imperialToggle.classList[1] == 'unitSelected') {
            if (ingredientUnit == 'g' || ingredientUnit == 'ml' || ingredientUnit == 'l') {
              fromMetricToImperialDataset(swapIngredient, ingredientQuantity, ingredientUnit);
            };
          };

          // update ingredient, quantity and unit
          ingredients.forEach((ing) => {
            let newIng = swapIngredient.id;
            updateTextWithOpacity(ing, newIng);
            let ingInput = document.getElementById(`ingredientInput-${ing.classList[2]}`);
            if (ingInput != null) {
              ingInput.value = newIng;
            };
          });

          quantities.forEach((quantity) => {
            if (swapIngredient.getAttribute('data-ingredient-quantity') == "") {
              let newQuantity = swapIngredient.getAttribute('data-ingredient-quantity');
              updateTextWithOpacity(quantity, newQuantity);
              let quantityInput = document.getElementById(`quantityInput-${quantity.classList[2]}`);
              if (quantityInput != null) {
                quantityInput.value = newQuantity;
              };
              swapIngredient.dataset.ingredientQuantity = ingredientQuantity;
              measureItem.dataset.ingredientQuantity = ingredientQuantity;
            } else {
              let newQuantity = Number.parseFloat(swapIngredient.getAttribute('data-ingredient-quantity')) * counter;
              updateTextWithOpacity(quantity, newQuantity);
              let quantityInput = document.getElementById(`quantityInput-${quantity.classList[2]}`);
              if (quantityInput != null) {
                quantityInput.value = newQuantity;
              };
              swapIngredient.dataset.ingredientQuantity = ingredientQuantity;
              measureItem.dataset.ingredientQuantity = ingredientQuantity;
            };
          });

          units.forEach((unit) => {
            let newUnit = swapIngredient.getAttribute('data-ingredient-unit');
            updateTextWithOpacity(unit, newUnit);
            let unitInput = document.getElementById(`unitInput-${unit.classList[2]}`);
            if (unitInput != null) {
              unitInput.value = newUnit;
            };
            swapIngredient.dataset.ingredientUnit = ingredientUnit;
            measureItem.dataset.ingredientUnit = ingredientUnit;
          });
        });
      });
    });
  };
};

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

const fromMetricToImperial = (quantity, unit) => {
  let quantityValue = Number.parseFloat(quantity.innerText);
  let quantityInput = document.getElementById(`quantityInput-${quantity.classList[2]}`);
  let unitInput = document.getElementById(`unitInput-${unit.classList[2]}`);

  if (unit.innerText == 'g') {
    unit.innerText = 'oz';
    quantity.innerText = (quantityValue / 28.35).toFixed(1);
    if (quantityInput != null && unitInput != null) {
      unitInput.value = 'oz';
      quantityInput.value = (quantityValue / 28.35).toFixed(1);
    };
  } else if (unit.innerText == 'ml') {
    unit.innerText = 'cups';
    quantity.innerText = (quantityValue / 284).toFixed(1);
    if (quantityInput != null && unitInput != null) {
      unitInput.value = 'cups';
      quantityInput.value = (quantityValue / 284).toFixed(1);
    };
  } else if (unit.innerText == 'l') {
    unit.innerText == 'cups';
    quantity.innerText = (quantityValue * 3.52).toFixed(1);
    if (quantityInput != null && unitInput != null) {
      unitInput.value = 'cups';
      quantityInput.value = (quantityValue * 3.52).toFixed(1);
    };
  };
};

const fromMetricToImperialDataset = (element, quantity, unit) => {
  let quantityValue = Number.parseFloat(quantity);

  if (unit == 'g') {
    element.dataset.ingredientUnit = 'oz';
    element.dataset.ingredientQuantity = (quantityValue / 28.35).toFixed(1);
  } else if (unit == 'ml') {
    element.dataset.ingredientUnit = 'cups';
    element.dataset.ingredientQuantity = (quantityValue / 284).toFixed(1);
  } else if (unit == 'l') {
    element.dataset.ingredientUnit == 'cups';
    element.dataset.ingredientQuantity = (quantityValue * 3.52).toFixed(1);
  };
};

export { unitConversion };
