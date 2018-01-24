class ContributionService
  class << self
    def create_temporal!(contributor, quantity)
      price = Money.new(Settings.contribution.price_cents)

      contributions = []

      quantity.times do
        contributions << Contribution.create!(
          contributor: contributor,
          price: price
        )
      end

      contributions
    end

    def make_pending!(contributions, stripe_charge_id)
      contributions.each do |contribution|
        contribution.update!(status: :pending, stripe_id: stripe_charge_id)
      end
    end
  end
end
