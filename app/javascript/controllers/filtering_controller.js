import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filtering"
export default class extends Controller {
  static targets = ["form", "style", "weather", "tops", "bottoms", "shoes", "dresses"]

  connect() {
  }

  update() {
    const url = `${this.formTarget.action}?style=${this.styleTarget.value}&items_weathers=${this.weatherTarget.value}&commit=Filter`
    fetch(url, {headers: {"Accept": "application/json"}})
      .then(response => response.json())
      .then((data) => {
        if (this.topsTarget.classList.contains("locked") === false) {
          this.topsTarget.outerHTML = data.top
        }
        if (this.bottomsTarget.classList.contains("locked") === false) {
          this.bottomsTarget.outerHTML = data.bottom
        }
        if (this.shoesTarget.classList.contains("locked") === false) {
          this.shoesTarget.outerHTML = data.shoes
        }
        if (this.dressesTarget.classList.contains("locked") === false) {
          this.dressesTarget.outerHTML = data.dresses
        }
      })
  }
}
