import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "url", "button" ]

  copy() {
    this.urlTarget.select()
    document.execCommand("copy")
    this.buttonTarget.innerHTML = "Copied!"
    setTimeout(() => {
      this.buttonTarget.innerHTML = "Copy"
    }, 5000);
  }
}
