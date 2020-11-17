%w(
  apache2
  php
  mysql-server
  php-mysqlnd
  expect
).each do |pkg|
  package pkg do
    action :install
  end
end
  
group 'www-user' do
  action :create
end
  