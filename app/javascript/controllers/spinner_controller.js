import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="spinner"
export default class extends Controller {
  connect() {
    document.addEventListener("direct-upload:start", this.show.bind(this));
  }
  hide() {
    document.getElementById("submit-btn").classList.remove("hidden");
    document.getElementById("spinner").classList.add("hidden");
  }
  show() {
    document.getElementById("submit-btn").classList.add("hidden");
    document.getElementById("spinner").classList.remove("hidden");
  }
}
