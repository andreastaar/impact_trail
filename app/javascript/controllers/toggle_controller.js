import { Controller } from "@hotwire/stimulus";

export default class extends toggleController {
  static targets = ["form"];
  connect() {console.log("hola")}
  fire() {
    this.formTarget.classList.toggle("d-none");
  }
}
