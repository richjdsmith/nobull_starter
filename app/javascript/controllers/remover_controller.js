import {
  Controller
} from 'stimulus'

export default class extends Controller {
  static targets = ['removable']
  remove(e) {
    e.preventDefault()
    this.removableTarget.remove()
  }
}