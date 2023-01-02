import { Controller } from "@hotwired/stimulus";
// import debounce from "debounce";

// Connects to data-controller="form"
export default class extends Controller {
  // initialize() {
  //   this.submit = debounce(this.submit.bind(this), 300);
  // }
  submit() {
    this.element.requestSubmit();
  }
  registerAnimation() {
    // Hide Login Animation and Form
    const loginbtn = document.getElementById("loginbtn");
    loginbtn.classList.add("hidden");
    loginbtn.classList.remove("line");

    const loginform = document.getElementById("login form");
    loginform.classList.add("hidden");

    // Show Registration Animation and Form
    const registerbtn = document.getElementById("registerbtn");
    registerbtn.classList.remove("hidden");
    registerbtn.classList.add("line");

    const registerform = document.getElementById("register form");
    registerform.classList.remove("hidden");
  }
  loginAnimation() {
    // Hide Registration Animation and Form
    const registerbtn = document.getElementById("registerbtn");
    registerbtn.classList.add("hidden");
    registerbtn.classList.remove("line");

    const registerform = document.getElementById("register form");
    registerform.classList.add("hidden");

    // Show Login Animation and Form
    const loginbtn = document.getElementById("loginbtn");
    console.log(loginbtn);
    loginbtn.classList.remove("hidden");
    loginbtn.classList.add("line");

    const loginform = document.getElementById("login form");
    loginform.classList.remove("hidden");
  }
}
