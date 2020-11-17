#
# Cookbook:: my_lamp
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'my_lamp::pkg'
include_recipe 'my_lamp::httpd'
include_recipe 'my_lamp::mysql'