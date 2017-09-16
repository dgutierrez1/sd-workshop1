#
# Cookbook:: haproxy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe 'haproxy::haproxy_install'
include_recipe 'haproxy::haproxy_config'