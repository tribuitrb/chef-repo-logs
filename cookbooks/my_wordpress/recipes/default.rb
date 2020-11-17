#
# Cookbook:: my_wordpress
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

# include_recipe 'my_lamp::default'
include_recipe 'my_wordpress::httpd'
include_recipe 'my_wordpress::sql'
include_recipe 'my_wordpress::wordpress'