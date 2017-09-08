#
# Cookbook:: httpd
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
#
include_recipe 'httpd::httpd_install'
include_recipe 'httpd::httpd_config'
include_recipe 'httpd::httpd_files'


