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

    def make_accepted!(contribution, user)
      contribution.update!(
        status: :accepted,
        partner: user.partner
      )
    end

    def make_completed!(contribution, item)
      contribution.update!(
        item: item,
        status: :completed,
        completed_at: Time.current
      )
    end

    def anchor_to_blockchain!(contribution)
      raise 'Contribution is not completed' unless contribution.completed?
      raise 'Tierion attrs already has been sent to blockchain' if contributor.tierion_hash? || contributor.tierion_receipt_id?

      result = BlockchainService.anchor(contribution, [
        :contributor_id,
        :partner_id,
        :item_type,
        :item_id,
        :price_cents,
        :price_currency,
        :completed_at,
        :stripe_id,
        :created_at
        ]
      )

      contribution.update!(
        tierion_hash: result.hash,
        tierion_receipt_id: result.id
      )
    end
  end
end
