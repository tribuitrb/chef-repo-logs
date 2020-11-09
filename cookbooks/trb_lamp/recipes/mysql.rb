package_name = 'mysql-server'
service_name = 'mysql'

# install mysql
# package package_name do
#   action :install
# end
execute 'mysql-server' do
  command 'apt update && apt install mysql-server -y'
end

# start mysql
# service service_name do
#   action [:enable, :start]
# end

# service service_name do
#   action :restart
# end

bash 'mysql_secure_installation' do
  # cwd ::File.dirname(src_filepath)
  user 'root'
  cwd 'root'
  code <<-EOH
    mysql -u root -p'MyNewPass'
    USE mysql;
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'Vietnam@2020';
    FLUSH PRIVILEGES;
  EOH
end

service 'apache2' do
  action :restart
end

# restart mysql
service service_name do
  action :restart
end