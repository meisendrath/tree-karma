class TierionService
  class << self
    def send_to_blockchain(contribution)
      raise 'Contribution is not completed' unless contribution.completed?

      contribution_json = contribution.to_json(only: [
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

      contribution_hash = Digest::SHA256.hexdigest(contribution_json)

      blockchain_client.send(contribution_hash)
    end

    private

    def blockchain_client
      Tierion::HashApi::Client.new(
        Rails.application.secrets.tierion_username,
        Rails.application.secrets.tierion_password
      )
    end
  end
end
