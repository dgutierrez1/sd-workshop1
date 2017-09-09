bash 'installation_partial1' do
	code <<-EOH
    curl --silent --location https://rpm.nodesource.com/setup_8.x  | sudo bash -
	sudo yum -y install nodejs
	mkdir -p /home/vagrant/graphql-server/server
	mkdir -p /home/vagrant/graphql-server/bin
	mkdir -p /home/vagrant/graphql-server/dist

	EOH
end


cookbook_file '/home/vagrant/graphql-server/package.json' do
	source 'package.json'
	mode 0644
	owner 'root'
	group 'wheel'
end

bash 'installation_partial2' do
	code <<-EOH
    npm install --prefix /home/vagrant/graphql-server/
	EOH
end


