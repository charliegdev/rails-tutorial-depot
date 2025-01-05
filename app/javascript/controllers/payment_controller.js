import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="payment"
export default class extends Controller {
  static targets = ["selection", "additionalFields"];

  initialize() {
    this.showAdditionalFields();
  }

  showAdditionalFields() {
    const selection = this.selectionTarget.value;

    for (const fields of this.additionalFieldsTarget) {
      const isSelected = fields.dataset.type === selection;

      fields.disabled = !isSelected;
      fields.hidden = !isSelected;
    }
  }
}
