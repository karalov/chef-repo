require "resolv"
servers = ["centos01","centos02"]
ips=[]
servers.each_with_index {|name, index| ips[index] = Resolv.getaddress(name) }
puts ips[0]
puts ips[1]

