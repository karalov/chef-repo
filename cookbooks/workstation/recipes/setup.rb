yum_package 'tree'
yum_package 'ntp'
package 'git'
package 'vim'
template '/etc/motd' do
  source 'motd.erb'
  variables(
    :name => 'Dimitry Karalov'
	)
  action :create
end
service 'ntpd' do
  action [:enable, :start]
end

user 'user1' do
  uid '123'
  comment 'test user #1'
  home '/home/user1'
  shell '/bin/bash'
end
group 'test' do
	members 'user1'
end
