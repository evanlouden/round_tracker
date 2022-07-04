import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['slope', 'rating' ]

  autofillRecentRoundInfo(event) {
    this.getRecentRoundInfo(event.target.value)
  }

  getRecentRoundInfo(courseId) {
    fetch('/courses/' + courseId).then((response) => {
      return response.json();
    }).then((result) => {
      this.slopeTarget.value = result.slope
      this.ratingTarget.value = result.rating
    })
  }
}
