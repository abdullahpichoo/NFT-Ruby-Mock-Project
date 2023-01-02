import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {}
  show() {
    const menu = document.getElementById("menu");
    menu.classList.remove("hidden");
    menu.classList.remove("w-0");

    const hamburger = document.getElementById("hamburger-icon");
    hamburger.classList.add("hidden");

    const cross = document.getElementById("close-icon");
    cross.classList.remove("hidden");
  }
  hide() {
    const menu = document.getElementById("menu");
    menu.classList.add("hidden");

    const hamburger = document.getElementById("hamburger-icon");
    hamburger.classList.remove("hidden");

    const cross = document.getElementById("close-icon");
    cross.classList.add("hidden");
  }
  NFTLineAnimation() {
    const pfpbtn = document.getElementById("pfpbtn");
    pfpbtn.classList.add("hidden");
    pfpbtn.classList.remove("line");
    document.getElementById("editprofile").classList.add("hidden");

    const nftbtn = document.getElementById("nftbtn");
    nftbtn.classList.remove("hidden");
    nftbtn.classList.add("line");
    document.getElementById("mynfts").classList.remove("hidden");
  }
  ProfileLineAnimation() {
    const nftbtn = document.getElementById("nftbtn");
    nftbtn.classList.add("hidden");
    nftbtn.classList.remove("line");
    document.getElementById("mynfts").classList.add("hidden");

    const pfpbtn = document.getElementById("pfpbtn");
    pfpbtn.classList.remove("hidden");
    pfpbtn.classList.add("line");
    document.getElementById("editprofile").classList.remove("hidden");
  }
}
