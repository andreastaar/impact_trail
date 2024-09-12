import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("hola")
  }

  fire(event) {
    event.preventDefault()
    this.formTarget.classList.toggle("d-none");
  }
}
