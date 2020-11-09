# TODO: Add support for multiple websites

default['wordpress_lamp']['site'] = 'test'
default['wordpress_lamp']['vhost']['server_admin'] = 'root@localhost'
default['wordpress_lamp']['vhost']['server_name'] = 'testrb.cf'
default['wordpress_lamp']['vhost']['server_alias'] = 'www.testrb.cf'
default['wordpress_lamp']['vhost']['port'] = '80'

default['wordpress_lamp']['sql']['import_sql']       = true
default['wordpress_lamp']['sql']['database']         = 'db_data'
default['wordpress_lamp']['sql']['database_user']    = 'user-www'
default['wordpress_lamp']['sql']['database_host']    = 'localhost'