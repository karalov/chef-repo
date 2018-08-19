#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

#node.default['haproxy']['members'] = [
# {
#   "hostname" => servers[0],
#   "ipaddress" => ips[0],
#  "port" => 80,
#   "ssl_port" => 80
#},
#{
#   "hostname" => servers[1],
#   "ipaddress" => ips[1],
#   "port" => 80,
#   "ssl_port" => 80
#}
#]

all_web_nodes =  search('node','role:web')
node.default['haproxy']['members']=[]
all_web_nodes.each do |web_node|
  member = {
    'hostname' => web_node['hostname'],
    'ipaddress' => web_node['ipaddress'],
    "port" => 80,
    "ssl_port" => 80
  }
 node.default['haproxy']['members'].push(member)
end

node.default['haproxy']['admin']['port'] = 8080
include_recipe "haproxy::manual" 
