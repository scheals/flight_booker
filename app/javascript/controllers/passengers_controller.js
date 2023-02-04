import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'passenger' ]
  static values = { amount: Number }

  connect() {
  }

  add(event) {
    event.preventDefault()
    this.amountValue++
    this.addPassengerButton = document.querySelector('[data-action="click->passengers#add"]')
    this.addPassengerButton.before(this.preparePassenger())
  }

  clonePassengerTemplate() {
    this.passengerFormTemplate = document.querySelector('#passengerTemplate')
    this.clone = this.passengerFormTemplate.content.cloneNode(true)
    return this.clone
  }

  preparePassenger() {
    this.templateClone = this.clonePassengerTemplate()
    this.setPassengerHeader(this.templateClone, this.amountValue)
    this.setPassengerAttributes(this.templateClone, this.amountValue - 1)
    return this.templateClone
  }

  setPassengerHeader(clone, passengerNumber) {
    this.header = clone.querySelector('h3')
    this.header.textContent = `Passenger ${passengerNumber}`
    return clone
  }

  setPassengerAttributes(clone, paramIndex) {
    this.labels = clone.querySelectorAll('div>div>label')
    this.inputs = clone.querySelectorAll('div>div>input')
    this.idAttribute = `booking_passengers_attributes_${paramIndex}`
    this.paramAttribute = `booking[passengers_attributes][${paramIndex}]`
    this.labels[0].setAttribute('for', `${paramIndex}_name`)
    this.inputs[0].setAttribute('id', `${this.idAttribute}_name`)
    this.inputs[0].setAttribute('name', `${this.paramAttribute}[name]`)
    this.labels[1].setAttribute('for', `${paramIndex}_email`)
    this.inputs[1].setAttribute('id', `${this.idAttribute}_email`)
    this.inputs[1].setAttribute('name', `${this.paramAttribute}[email]`)
    return clone
  }
}
