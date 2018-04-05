import flatpickr from "flatpickr"
import "flatpickr/dist/themes/dark.css" // A path to the theme CSS
function flatpickrr() {
  flatpickr(".datepicker", {
    altInput: true,
    allowInput: true
  });
};
export { flatpickrr };
