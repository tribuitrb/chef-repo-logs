sql_password = 'Vietnam@2020'

cookbook_file 'tmp/sql_dump.sql' do
  source 'sql_dump.sql'
  owner 'root'
  group 'root'
  mode '0444'
  action :create
end

bash 'import sql' do
  cwd "/tmp"
  code <<-EOH
  mysql -u root -p'Vietnam@2020' -e "CREATE USER '#{node['wordpress_lamp']['sql']['database_user']}'@'#{node['wordpress_lamp']['sql']['database_host']}' IDENTIFIED BY 'Vietnam@2020'"
  mysql -u root -p'Vietnam@2020' -e "CREATE DATABASE #{node['wordpress_lamp']['sql']['database']}"
  mysql -u root -p'Vietnam@2020' -e "GRANT ALL PRIVILEGES ON #{node['wordpress_lamp']['sql']['database']}.* to '#{node['wordpress_lamp']['sql']['database_user']}'@'#{node['wordpress_lamp']['sql']['database_host']}'"
  mysql -u root -p'Vietnam@2020' -e "FLUSH PRIVILEGES"
  EOH
  only_if { node['wordpress_lamp']['sql']['import_sql'] }
end

#mysql -u root -p#{sql_password} #{node['wordpress_lamp']['sql']['database']} < /tmp/sql_dump.sql