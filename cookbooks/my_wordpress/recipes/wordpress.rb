sql_password = 'Vietnam@2020'
directory "/var/www/#{node['my_wordpress']['site']}/" do
  owner "root"
  group "root"
  mode "2775"
end

cookbook_file 'var/www/latest.tar.gz' do
  source 'latest.tar.gz'
  mode '0755'
  owner 'root'
end

bash "extracting files" do
  cwd "/var/www"
  code <<-EOH
  tar -xzf latest.tar.gz
  cp -r wordpress/* /var/www/#{node['my_wordpress']['site']}/
  EOH
  # not_if {File.exists?("/var/www/")}
end

template "/var/www/#{node['my_wordpress']['site']}/wp-config.php" do
  source 'wp-config.php.erb'
  variables({
    DatabasePassword: sql_password,
    DatabaseName:     node['my_wordpress']['sql']['database'],
    DatabaseUser:     node['my_wordpress']['sql']['database_user'],
    DatabaseHost:     node['my_wordpress']['sql']['database_host']
  })
end

execute 'chown-var-www' do
  command 'chown -R root:root /var/www'
  action :run
end

execute 'chmod-var-www-dir' do
  command 'find /var/www -type d -exec sudo chmod 2775 {} \;'
  action :run
end

execute 'chmod-var-www-file' do
  command 'find /var/www -type f -exec sudo chmod 0664 {} \;'
  action :run
end