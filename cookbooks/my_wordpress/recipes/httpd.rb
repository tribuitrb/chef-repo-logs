
# execute "disable-site" do
#   command "a2dissite /etc/apache2/sites-available/*.conf"
#   action :nothing
# end

# execute "config-site" do
#   command "a2ensite /etc/apache2/sites-available/#{node['my_wordpress']['site']}.conf"
#   action :nothing
# end
template "/etc/apache2/sites-available/#{node['my_wordpress']['site']}.conf" do
  source 'vhost.erb'
  variables({
    Website:      node['my_wordpress']['site'],
    ServerAdmin:  node['my_wordpress']['vhost']['server_admin'],
    ServerName:   node['my_wordpress']['vhost']['server_name'],
    ServerAlias:  node['my_wordpress']['vhost']['server_alias'],
    Port:         node['my_wordpress']['vhost']['port']
  })
end

bash "config site" do
  cwd "/etc/apache2/sites-available/"
  code <<-EOH
  a2ensite #{node['my_wordpress']['site']}.conf
  a2dissite *.conf
  a2ensite #{node['my_wordpress']['site']}.conf
  EOH
  # not_if {File.exists?("/var/www/")}
end

service 'apache2' do
  action :restart
end

