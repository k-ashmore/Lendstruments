import flatpickr from "flatpickr";

const initFlatpickr = () => {
  window.addEventListener("turbolinks:load", function() {
    flatpickr(".datepicker", {
      altInput: true
    });
  })
}

export { initFlatpickr };
