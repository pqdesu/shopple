import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  updateQuantity(event) {
    const quantityValue = event.target.value;
    const quantityInput = document.getElementById("quantity-input");

    if (quantityInput) {
      quantityInput.value = quantityValue;
    }
  }
}
