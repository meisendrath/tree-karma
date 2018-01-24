class StripeService
  class << self
    def create_charge!(contributions, token)
      raise 'Contributions do not have the same contributor' unless contributions.uniq(&:contributor).one?
      raise 'Some contributions has been charged already' unless contributions.pluck(:stripe_id).reject(&:blank?).empty?

      amount = contributions.sum(&:price)

      Stripe::Charge.create(
        amount: amount.cents,
        currency: amount.currency_as_string.downcase,
        metadata: {
          contribution_ids: contributions.pluck(:id).join(', '),
          contributor_id: contributions.last.contributor.id
        },
        source: token
      )
    end
  end
end
