import { Controller } from "@hotwired/stimulus"
import { bottom } from "@popperjs/core"

// Connects to data-controller="outfit"
export default class extends Controller {
  static targets = ["form", "topField", "bottomField", "shoeField", "dressField"]

  insertForm(event) {
    event.preventDefault()
    const dressId = document.querySelector(".tab-pane.active.show .dress-value.active")?.dataset.dressId
    const topId = document.querySelector(".tab-pane.active.show .top-value.active")?.dataset.topId
    const bottomId = document.querySelector(".tab-pane.active.show .bottom-value.active")?.dataset.bottomId
    const shoeId = document.querySelector(".shoe-value.active")?.dataset.shoeId
    if (dressId) {
      this.dressFieldTarget.value = dressId
    }
    if (topId) {
      this.topFieldTarget.value = topId
    }
    if (bottomId) {
      this.bottomFieldTarget.value = bottomId
    }
    this.shoeFieldTarget.value = shoeId
    this.formTarget.submit();
  }
}
