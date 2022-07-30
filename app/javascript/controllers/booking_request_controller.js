import { end } from "@popperjs/core";
import { Controller } from "stimulus"
import { initFlatpickr } from "../plugins/flatpickr";

export default class extends Controller {
  static targets = [ "startDate", "endDate", "totalCost" ]
  static values = { dailyRate: Number }
  connect() {
    initFlatpickr();
  }

  calculateTotal() {
    if (this.endDateTarget.value && this.startDateTarget.value) {
      const numDays = (Date.parse(this.endDateTarget.value) - Date.parse(this.startDateTarget.value)) / (1000 * 60 * 60 * 24)
      const total = numDays * parseInt(this.dailyRateValue)
      this.totalCostTarget.innerText = total.toLocaleString("ja")
    }

    // Find how many days
    // multiply days by raily rate
    // display(inject) total in html
  }
}
