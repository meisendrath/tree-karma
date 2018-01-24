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
end




# folder = '/Users/maxeisendrath/Desktop/ipfs-test'


# folder = IPFS::Upload.folder('test') do |test|
#       test.add_file('hello.txt') do |fd|
#       fd.write 'Hello'
#     end
#
#     test.add_file('world.txt') do |fd|
#       fd.write 'World'
#   end
# end
