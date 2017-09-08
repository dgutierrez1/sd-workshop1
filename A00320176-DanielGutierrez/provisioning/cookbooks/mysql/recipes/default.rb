#
# Cookbook:: mysql
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'mysql::mysql_install'
include_recipe 'mysql::mysql_config'