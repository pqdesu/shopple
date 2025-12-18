import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.updateHiddenField();
  }

  increase() {
    const input = document.getElementById("quantity");
    const currentValue = parseInt(input.value) || 1;
    const maxValue = parseInt(input.max) || 100;

    if (currentValue < maxValue) {
      input.value = currentValue + 1;
      this.updateHiddenField();
    }
  }

  decrease() {
    const input = document.getElementById("quantity");
    const currentValue = parseInt(input.value) || 1;
    const minValue = parseInt(input.min) || 1;

    if (currentValue > minValue) {
      input.value = currentValue - 1;
      this.updateHiddenField();
    }
  }

  updateQuantity(e) {
    this.updateHiddenField();
  }

  updateHiddenField() {
    const quantityInput = document.getElementById("quantity");
    const quantityField = document.getElementById("quantity-input");

    if (quantityInput && quantityField) {
      quantityField.value = quantityInput.value;
    }
  }
}
