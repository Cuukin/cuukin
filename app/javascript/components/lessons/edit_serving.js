const lessonServingCalc = () => {
  const servingContainer = document.querySelector('.lesson-overview-serving');

  const addBtn = document.querySelector('#plusBtn');
  const minusBtn = document.querySelector('#minusBtn');
  const servingNumber = document.querySelector('.serving-paragraph');

  let ingredientMeasures = document.querySelectorAll('.ingredient-quantity');

  let ingredientMeasuresArray = []

  ingredientMeasures.forEach((ingredientMeasure) => {
    let measureNumber = ingredientMeasure.innerText;
    measureNumber = Number.parseFloat(measureNumber);
    ingredientMeasuresArray.push(measureNumber);
  });

  let counter = 1;

  if (servingContainer) {

    minusBtn.style.visibility = "hidden";

    addBtn.addEventListener('click', () => {
      minusBtn.style.visibility = "";

      counter += 1;

      if (counter == 4) {
        addBtn.style.visibility = "hidden";
        servingNumber.innerText = `${counter} serving(s)`;
      } else {
        servingNumber.innerText = `${counter} serving(s)`;
      };

      let index = -1;
      ingredientMeasures.forEach((measure) => {
        index += 1;
        measure.innerText = (Number.parseFloat(measure.innerText) + ingredientMeasuresArray[index]).toFixed();
      });
    });

    minusBtn.addEventListener('click', () => {
      addBtn.style.visibility = "";

      counter -= 1;

      if (counter == 1) {
        minusBtn.style.visibility = "hidden";
        servingNumber.innerText = `${counter} serving(s)`;
      } else {
        servingNumber.innerText = `${counter} serving(s)`;
      };

      let index = -1;
      ingredientMeasures.forEach((measure) => {
        index += 1;
        measure.innerText = Number.parseFloat(measure.innerText) - ingredientMeasuresArray[index];
      });
    });
  };
}

export { lessonServingCalc };
