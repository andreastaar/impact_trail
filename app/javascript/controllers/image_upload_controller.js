import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["preview"];

  previewImages(event) {
    this.previewTarget.innerHTML = "";
    const files = event.target.files;
    for (const file of files) {
      const reader = new FileReader();
      reader.onload = () => {
        const img = document.createElement("img");
        img.src = reader.result;
        img.classList.add("img-fluid");
        img.style.maxWidth = "200px";
        this.previewTarget.appendChild(img);
      };
      reader.readAsDataURL(file);
    }
  }
}
