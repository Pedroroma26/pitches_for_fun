import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

export default class extends Controller {
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {enableTime: true})
    flatpickr(this.endTimeTarget, {enableTime: true})
  }
}
