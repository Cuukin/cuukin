const preventSelectDoubleClick = () => {
  document.addEventListener('mousedown', function (event) {
    if (event.detail > 1) {
      event.preventDefault();
      // preventing text selection on double click
    }
  }, false);
}

export { preventSelectDoubleClick };
