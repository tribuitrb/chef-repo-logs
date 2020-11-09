package_name = 'apache2'
service_name = 'apache2'
document_root = '/var/www/html'

package package_name do
  action :install
end

service service_name do
  action [:enable, :start]
end

cookbook_file "#{document_root}/index.html" do
  source 'index.html'
  mode '0644'
end