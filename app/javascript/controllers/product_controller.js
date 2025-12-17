import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.querySelectorAll(".size-btn").forEach((button) => {
      button.addEventListener("click", (event) => {
        event.preventDefault();
        const sizeInput = document.getElementById("selected-size");
        if (button.classList.contains("selected")) {
          // If already selected, unselect it
          button.classList.remove("selected");
          button.classList.add("unselected");
          if (sizeInput) {
            sizeInput.value = "";
          }
        } else {
          // Remove selected from all, select this one
          this.element.querySelectorAll(".size-btn").forEach((btn) => {
            btn.classList.remove("selected");
            btn.classList.add("unselected");
          });
          button.classList.add("selected");
          button.classList.remove("unselected");
          if (sizeInput) {
            sizeInput.value = button.dataset.size;
          }
        }
      });
    });
  }
}
