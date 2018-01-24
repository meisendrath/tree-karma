class BlockchainService
  class << self
    def anchor(object, attrs)
      object_hash = generate_hash(object, attrs)
      client.send(object_hash)
    end

    private

    def generate_hash(object, attrs)
      object_json = contribution.to_json(only: attrs)
      Digest::SHA256.hexdigest(object_json)
    end

    def client
      Tierion::HashApi::Client.new(
        Rails.application.secrets.tierion_username,
        Rails.application.secrets.tierion_password
      )
    end
  end
end
