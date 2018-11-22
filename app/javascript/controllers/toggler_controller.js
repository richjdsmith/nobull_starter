import {
  Controller
} from 'stimulus'

export default class extends Controller {
  static targets = ['toggleable', 'hideable', 'showable']
  toggle(e) {
    e.preventDefault()
    this.toggleableTarget.classList.toggle('hidden')
  }
  show(e) {
    e.preventDefault()
    this.hideableTarget.classList.remove('hidden')
  }
  hide(e) {
    e.preventDefault()
    this.removableTarget.classList.add('hidden')
  }
}