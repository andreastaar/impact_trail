import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()


// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    startDate: String,
    endDate: String
  }
  connect() {

    console.log(this.startDateValue)
    // console.log("hello World")
    flatpickr(this.element, {
      // minDate: "today", maxDate: "2024-09-30"
      minDate: this.startDateValue,
      maxDate: this.endDateValue
    })
  }
}
