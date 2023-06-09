import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="outfit"
export default class extends Controller {
  static targets = ["form", "topField", "bottomField", "shoeField"]

  insertForm(event) {
    event.preventDefault()
    const topId = document.querySelector(".top-value.active").dataset.topId
    const bottomId = document.querySelector(".bottom-value.active").dataset.bottomId
    const shoeId = document.querySelector(".shoe-value.active").dataset.shoeId
    this.topFieldTarget.value = topId
    this.bottomFieldTarget.value = bottomId
    this.shoeFieldTarget.value = shoeId
    this.formTarget.submit();
  }
}
