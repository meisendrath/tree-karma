$ export TIERION_USERNAME=meisendr@gmail.com # SQL Authentication here
$ export TIERION_PASSWORD=RideWuji135

 t = Tierion::HashApi::Client.new #call our client

#  my_hash = Digest::SHA256.hexdigest('foo')
# => "2c26b46b68ffc68ff99b453c1d30413413422d706483bfa0f98a5e886266e7ae">
#
#   t.send(my_hash)
#  Tierion::HashApi::HashItem ... # use this for hash method on each JSON object

# > t.hash_items
# => [Tierion::HashApi::HashItem ..., Tierion::HashApi::HashItem ...] # This is the only Item that will display all ID's for hashes sent

# > t.receipt(h)
# => Tierion::HashApi::Receipt ... # recieve the blockchain receipt for a given hash

# > r.valid?
# => true   # This can be run to validate the accuracy of the sent hash with the original merkle root (we construct this separately)

# Receipts can take several hours to recieve. Confirmations are returned in the form of BTCOpReturns

# Receipt#to_pretty_json #
# ^Use this method to put the receipt into a JSON for IPFS adds.
