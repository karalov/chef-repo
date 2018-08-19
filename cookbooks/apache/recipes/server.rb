package 'httpd' do
  action :install
end

remote_file '/var/www/html/cat.jpg' do
  source 'https://www.petmd.com/sites/default/files/what-does-it-mean-when-cat-wags-tail.jpg'
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  variables(
    :name => 'Dima'
  )
  action :create
end

cookbook_file '/var/www/html/error.html' do
  source 'error.html'
end

service 'httpd' do
  action [:enable, :start]
end
