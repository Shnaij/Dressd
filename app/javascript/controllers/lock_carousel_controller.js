import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="lock-carousel"
export default class extends Controller {

  static targets = ["input", "item", "arrow"]

  connect() {
  }

  lock(event) {
    this.arrowTargets.forEach((arrow) => {
      arrow.classList.toggle("d-none")
    })

    this.element.classList.toggle("locked")

    if (event.currentTarget.innerHTML === '<i class="fa-solid fa-lock"></i>') {
      event.currentTarget.innerHTML = '<i class="fa-solid fa-unlock"></i>'
    } else {
      event.currentTarget.innerHTML = '<i class="fa-solid fa-lock"></i>'
    }
  }
}
