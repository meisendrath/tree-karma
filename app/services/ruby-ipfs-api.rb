# require 'ipfs-api'

folder = '/Users/maxeisendrath/Desktop/ipfs-test'

ipfs = IPFS::Connection.new
folder = IPFS::Upload.folder('test') do |test|
  test.add_file('hello.txt') do |fd|
    fd.write 'Hello'
  end
  test.add_file('world.txt') do |fd|
    fd.write 'World'
  end
end
ipfs.add folder do |node|
  # display each uploaded node:
  print "#{node.name}: #{node.hash}\n" if node.finished?
end
