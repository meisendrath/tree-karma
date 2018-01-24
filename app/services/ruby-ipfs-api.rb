# require 'ipfs-api'
# require 'ipfs-client'

Class IPFS
  class << self
    def upload(receipt)
      ipfs = IPFS::Connection.new
      client = IPFS::Client.default

      ipfs.add receipt do |node|
      # display each uploaded node:
      p "#{node.name}: #{node.hash}\n" if node.finished?
  end

    def our_records(results)
      results_storage = "#{node.name}: #{node.hash}\n"
      # Send results_storage back to rails db

end
