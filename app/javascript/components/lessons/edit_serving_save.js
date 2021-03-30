const lessonServingCalc = () => {
  const servingContainer = document.querySelector('.lesson-overview-serving');
  const addBtn = document.querySelector('#plusBtn');
  const minusBtn = document.querySelector('#minusBtn');
  const servingNumber = document.querySelector('.serving-paragraph');

  const ingredientMeasures = document.querySelectorAll('.ingredient-quantity');

  let counter = 1;

  let ingredientMeasuresArray = []

  ingredientMeasures.forEach((measure) => {
    let measureNumber = measure.innerText;
    measureNumber = Number.parseFloat(measureNumber);
    ingredientMeasuresArray.push(measureNumber);
  });

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
      ingredientMeasuresArray.forEach((measure) => {
        index += 1;
        let newMeasure = measure * counter;
        ingredientMeasures[index].innerText = `${newMeasure}`;
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
      ingredientMeasuresArray.forEach((measure) => {
        index += 1;
        let newMeasure = measure * counter;
        ingredientMeasures[index].innerText = `${newMeasure}`;
      });
    });
  };

}

export { lessonServingCalc };
