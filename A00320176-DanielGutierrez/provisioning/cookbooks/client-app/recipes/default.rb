#
# Cookbook:: client-app
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
bash 'nodejs_install' do
	code <<-EOH
    curl --silent --location https://rpm.nodesource.com/setup_8.x  | sudo bash -
    sudo yum -y install nodejs
    mkdir -p /home/vagrant/client/
    EOH
end

yum_package 'git'

# execute 'install_ng' do
#     command 'npm install -g @angular/cli'   
# end

git '/home/vagrant/client/apollo-angular2-example' do
    repository 'https://github.com/dgutierrez1/apollo-angular2-example.git'
    revision 'master'
    action :sync
end

execute 'client_install' do
    command 'npm install --prefix /home/vagrant/client/apollo-angular2-example/'   
end

execute 'client_start' do
    command 'npm run production --prefix /home/vagrant/client/apollo-angular2-example/'   
end