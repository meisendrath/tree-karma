$(document).on 'turbolinks:load', ->
  if (cardContainer = $('#js-stripe-card')).length > 0

    form = cardContainer.closest 'form'
    form.valid = false
    stripe = Stripe($('meta[name="stripe-key"]').attr('content'))
    card = stripe.elements().create 'card'
    card.mount '#js-stripe-card'

    continueSubmit = (result) =>
      if result.token
        input = $ '<input>'
        input.prop 'type', 'hidden'
        input.prop 'name', 'stripe_token'
        input.prop 'value', result.token.id
        input.appendTo form

        form.valid = true
        form.submit()

    form.on 'submit', (e) =>
      e.preventDefault() unless form.valid

      stripe
        .createToken card
        .then continueSubmit

      return form.valid
