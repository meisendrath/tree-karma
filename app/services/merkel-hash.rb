# A new, empty Merkle tree dictionary
dict = Murky::Dict()

# Specify a custom backing dictionary, default implementation is Hash
dict = Murky::Dict(data: acts_like_a_dictionary) # USE THIS FOR RAILS DB ADTs 

# Specify a custom digest class, must #respond_to?(:digest)
dict = Murky::Dict(digest: Digest::SHA256)
