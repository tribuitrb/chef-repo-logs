  
bash 'create user and databases' do
  cwd "/tmp"
  code <<-EOH
  mysql -e "CREATE USER '#{node['my_wordpress']['sql']['database_user']}'@'#{node['my_wordpress']['sql']['database_host']}' IDENTIFIED BY 'Vietnam@2020'"
  mysql -e "CREATE DATABASE #{node['my_wordpress']['sql']['database']}"
  mysql -e "GRANT ALL PRIVILEGES ON #{node['my_wordpress']['sql']['database']}.* to '#{node['my_wordpress']['sql']['database_user']}'@'#{node['my_wordpress']['sql']['database_host']}'"
  mysql -e "FLUSH PRIVILEGES"
  EOH
end