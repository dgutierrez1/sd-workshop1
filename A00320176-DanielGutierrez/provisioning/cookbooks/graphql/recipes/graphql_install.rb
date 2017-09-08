bash 'installation_partial1' do
	code <<-EOH
    curl --silent --location https://rpm.nodesource.com/setup_8.x  | sudo bash -
	sudo yum -y install nodejs
    mkdir -p /home/vagrant/graphql-server/
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
	npm install --prefix /home/vagrant/graphql-server/ babel --save
	npm install --prefix /home/vagrant/graphql-server/ babel-register --save-dev
	npm install --prefix /home/vagrant/graphql-server/ express --save
	npm install --prefix /home/vagrant/graphql-server/ body-parser --save
	npm install --prefix /home/vagrant/graphql-server/ graphql --save
	npm install --prefix /home/vagrant/graphql-server/ babel-cli --save-dev	
	EOH
end


