cookbook_file '/etc/yum.repos.d/mongodb-org-3.2.repo' do
	source 'MongoDB.repo'
	mode 0644
	owner 'root'
	group 'wheel'
end


#yum_package 'mongodb-org'


bash 'install_mongodb' do
	code <<-EOH
    yum  install -y mongodb-org
    npm install --prefix /home/vagrant/graphql-server/ mongoose
	EOH
end

cookbook_file '/home/vagrant/graphql-server/mongodb.js' do
	source 'mongodb.js'
	mode 0644
	owner 'root'
	group 'wheel'
end