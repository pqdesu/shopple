import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.querySelectorAll(".size-btn").forEach((button) => {
      button.addEventListener("click", () => {
        button.classList.toggle("unselected");
        button.classList.toggle("selected");
        console.log(button);
      });
    });
  }
}
