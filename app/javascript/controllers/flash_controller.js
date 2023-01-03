import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    this.element.classList.remove("hidden");
    setTimeout(() => {
      this.element.classList.add("hidden");
    }, 3000);
  }
}
