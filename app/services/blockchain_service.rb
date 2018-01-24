class BlockchainService
  class << self

    @@blockchain = Blockchain.new

    def add(contribution)
      all_blocks = @@blockchain << contribution.to_json
      b = all_blocks.last
      # save somewhere this block
      b
    end
  end
end

# require BlockchainLite
# require "digest"
#
# class Block
#   attr_reader :index
#   attr_reader :timestamp
#   attr_reader :transactions_count
#   attr_reader :transactions
#   attr_reader :transactions_hash    # merkelroot
#   attr_reader :previous_hash
#   attr_reader :nonce                # ("lucky" number used once) - proof of work if hash starts with leading zeros (00)
#   attr_reader :hash
#
#
#   def self.first( data="Genesis" )    # create genesis block
#       ## uses index zero (0) and arbitrary previous_hash ("0")
#       Block.new( 0, data, "0" )
#     end
#
#   def self.next( previous, data="Transaction Data..." )
#       Block.new( previous.index+1, data, previous.hash )
#     end
#
#
# end  # class Block
#
# def calculate_hash()
#   sha = Digest::SHA256.new
#     sha.update( @timestamp.to_s +
#                 @transactions.to_s +
#                 @previous_hash )
#     sha.hexdigest
# end
#
# # Do we need Proof of Work methods or other mining scenarios?
#
# def add_transaction() #
#
# end
#
# def verify_chain()
#
# end
#
#
# ## For storing blocks in a merkle tree...
#   #merkle = Merkletree.for (
#   #JSON data inputs
# )
