sql_password = 'Vietnam@2020'

directory "/var/www/#{node['wordpress_lamp']['site']}/" do
  action :create
  owner "user-www"
  group "user-www"
  mode "2775"
end

directory "/var/www/#{node['wordpress_lamp']['site']}/current/" do
  action :create
  owner "user-www"
  group "user-www"
  mode  "2775"
  recursive true
end

template "/var/www/#{node['wordpress_lamp']['site']}/current/wp-config.php" do
  source 'wp-config.php.erb'
  # notifies :restart, 'service[apache2]', :delayed
  variables({
    DatabasePassword: sql_password,
    DatabaseName:     node['wordpress_lamp']['sql']['database'],
    DatabaseUser:     node['wordpress_lamp']['sql']['database_user'],
    DatabaseHost:     node['wordpress_lamp']['sql']['database_host']
  })
end

execute 'chown-var-www' do
  command 'chown -R user-www:root /var/www'
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