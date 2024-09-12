import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["editForm"];

  toggleEdit() {
    this.editFormTarget.classList.toggle("d-none");
  }
}
