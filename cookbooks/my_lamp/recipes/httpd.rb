execute 'apache_configtest' do
  command 'apt-get update -y'
end
  
package 'apache2' do
  action :install
end
  
service 'apache2' do
  action [:start,:enable]
end
  
group 'www-user' do
  action :modify
  members 'root'
  append true
end
  
bash 'var-www-user-prems' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
  chown -R root:www /var/www
  chmod 2775 /var/www
  find /var/www -type d -exec chmod 2775 {} \\;
  find /var/www -type f -exec chmod 0664 {} \\;
  EOH
end