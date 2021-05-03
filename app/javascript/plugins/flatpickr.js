import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true,
    enableTime: true,
    minDate: "today",
    dateFormat: "d.m.Y"
  });
}

export { initFlatpickr };
