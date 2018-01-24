class StripeService
  class << self
    def create_customer!(user)
      Stripe::Customer.create(
        email: user.email,
        metadata: { user_id: user.id }
      )
    end

    def create_charge!(contributions, token:)
      raise 'Contributions do not have the same contributor' unless contributions.uniq(&:contributor).one?
      raise 'Some contributions has been charged already' unless contributions.pluck(:stripe_id).reject(&:blank?).empty?

      amount = contributions.sum(&:price)

      Stripe::Charge.create(
        amount: amount.cents,
        currency: amount.currency_as_string.downcase,
        metadata: { contribution_ids: contributions.pluck(:id) },
        customer: contributions.last.contributor.stripe_id,
        source: token
      )
    end

    def create_source!(user, token:)
      customer = Stripe::Customer.retrieve(user.stripe_id)
      customer.sources.create(source: token)
    end
  end
end
