const unitConversion = () => {

  // Conversion Calcs

  // ml / 284 = cups
  // dl / 2.841 = cups
  // l * 3.52 = cups

  // gram / 28.35 = oz
  // kg * 35.274 = oz

  const unitBtn = document.querySelector('.unit-conversion-btn');
  const units = document.querySelectorAll('.unit');

  if (unitBtn) {
    unitBtn.addEventListener('click', () => {
      console.log('working');

      units.forEach((unit) => {
        unit.classList.toggle('unitSelected');
      });
    });
  };



  // const ingredientMeasures = document.querySelectorAll('.ingredient-measure span');

  // const ingredientsInfos = document.querySelectorAll('.ingredient-measure');

  // let ingredientMeasuresArray = []

  // ingredientMeasures.forEach((measure) => {
  //   let measureNumber = measure.innerText;
  //   measureNumber = Number.parseFloat(measureNumber);
  //   ingredientMeasuresArray.push(measureNumber);
  // });

  // if (servingContainer) {
  //   minusBtn.style.visibility = "hidden";
  //   addBtn.addEventListener('click', () => {
  //     minusBtn.style.visibility = "";
  //     counter += 1;
  //     if (counter == 4) {
  //       addBtn.style.visibility = "hidden";
  //       servingNumber.innerText = `${counter} serving(s)`;
  //     } else {
  //       servingNumber.innerText = `${counter} serving(s)`;
  //     };

  //     let index = -1;
  //     ingredientMeasuresArray.forEach((measure) => {
  //       index += 1;
  //       let newMeasure = measure * counter;
  //       ingredientMeasures[index].innerText = `${newMeasure}`;
  //     });
  //   });

  //   minusBtn.addEventListener('click', () => {
  //     addBtn.style.visibility = "";
  //     counter -= 1;
  //     if (counter == 1) {
  //       minusBtn.style.visibility = "hidden";
  //       servingNumber.innerText = `${counter} serving(s)`;
  //     } else {
  //       servingNumber.innerText = `${counter} serving(s)`;
  //     };

  //     let index = -1;
  //     ingredientMeasuresArray.forEach((measure) => {
  //       index += 1;
  //       let newMeasure = measure * counter;
  //       ingredientMeasures[index].innerText = `${newMeasure}`;
  //     });
  //   });
  // };

}

export { unitConversion };
