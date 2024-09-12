import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-form"
export default class extends Controller {
  static targets = ["form"]

  fire() {
    this.formTarget.classList.toggle("d-none")
  }
}
