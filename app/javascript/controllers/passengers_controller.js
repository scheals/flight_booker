import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ 'passenger' ]
  static values = { amount: Number, index: Number }

  connect() {
  }

  add(event) {
    event.preventDefault()
    this.amountValue++
    this.addPassengerButton = document.querySelector('[data-action="click->passengers#add"]')
    this.addPassengerButton.before(this.preparePassenger())
  }

  remove(event) {
    event.preventDefault()
    if (this.passengerTargets.length == 1) return console.log("Can't get rid of the last one!")
    this.amountValue--
    this.deletedPassenger = event.target.parentNode
    this.startingIndex = this.passengerTargets.findIndex((target) => target === this.deletedPassenger) + 1
    this.passengersToUpdate = this.passengerTargets.slice(this.startingIndex, this.passengerTargets.length)
    this.deletedPassenger.remove()
    this.passengersToUpdate.forEach((passenger) => this.preparePassenger(passenger, this.startingIndex++))
  }

  clonePassengerTemplate() {
    this.passengerFormTemplate = document.querySelector('#passengerTemplate')
    this.clone = this.passengerFormTemplate.content.cloneNode(true)
    return this.clone
  }

  preparePassenger(passenger = this.clonePassengerTemplate(), passengerNumber = this.amountValue) {
    this.setPassengerHeader(passenger, passengerNumber)
    this.setPassengerAttributes(passenger, passengerNumber - 1)
    return passenger
  }

  setPassengerHeader(passenger, passengerNumber) {
    this.header = passenger.querySelector('h3')
    this.header.textContent = `Passenger ${passengerNumber}`
    return passenger
  }

  setPassengerAttributes(passenger, paramIndex) {
    this.labels = passenger.querySelectorAll('div>div>label')
    this.inputs = passenger.querySelectorAll('div>div>input')
    this.idAttribute = `booking_passengers_attributes_${paramIndex}`
    this.paramAttribute = `booking[passengers_attributes][${paramIndex}]`
    this.labels[0].setAttribute('for', `${paramIndex}_name`)
    this.inputs[0].setAttribute('id', `${this.idAttribute}_name`)
    this.inputs[0].setAttribute('name', `${this.paramAttribute}[name]`)
    this.labels[1].setAttribute('for', `${paramIndex}_email`)
    this.inputs[1].setAttribute('id', `${this.idAttribute}_email`)
    this.inputs[1].setAttribute('name', `${this.paramAttribute}[email]`)
    return passenger
  }
}
