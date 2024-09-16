import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="location-full"
export default class extends Controller {
  static targets = ["location", "city", "full"]
  connect() {

  }

  updateFullLocation() {
    const country = this.locationTarget.value
    const city = this.cityTarget.value
    const full = `${city}, ${country}`
    this.fullTarget.value = full
  }
}
