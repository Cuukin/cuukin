const lessonServingCalc = () => {
  const servingContainer = document.querySelector('.lesson-overview-serving');
  const addBtn = servingContainer.querySelector('#plusBtn');
  const minusBtn = servingContainer.querySelector('#minusBtn');
  const servingNumber = servingContainer.querySelector('p');

  const ingredientMeasures = document.querySelectorAll('.ingredient-measure span');

  let counter = 1;

  let ingredientMeasuresArray = []

  ingredientMeasures.forEach((measure) => {
    let measureNumber = measure.innerText;
    measureNumber = Number.parseInt(measureNumber, 10);
    ingredientMeasuresArray.push(measureNumber);
  });

  if (servingContainer) {
    addBtn.addEventListener('click', () => {
      counter += 1;
      if (counter == 5) {
        counter = 1;
      };
      servingNumber.innerText = `${counter} serving(s)`;

      let index = -1;
      ingredientMeasuresArray.forEach((measure) => {
        index += 1;
        let newMeasure = measure * counter;
        ingredientMeasures[index].innerText = `${newMeasure}`;
      });
    });

    minusBtn.addEventListener('click', () => {
      counter -= 1;
      if (counter == 0) {
        counter = 4;
      };
      servingNumber.innerText = `${counter} serving(s)`;

      let index = -1;
      ingredientMeasuresArray.forEach((measure) => {
        index += 1;
        let newMeasure = measure * counter;
        ingredientMeasures[index].innerText = `${newMeasure}`;
      });
    });
  };

}

export { lessonServingCalc };
