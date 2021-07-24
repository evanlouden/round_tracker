import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form"]

  toggleSearch() {
    if (this.formTarget.classList.contains("hidden")) {
      this.formTarget.classList.remove("hidden")
    } else {
      this.formTarget.classList.add("hidden")
    }
  }
}
