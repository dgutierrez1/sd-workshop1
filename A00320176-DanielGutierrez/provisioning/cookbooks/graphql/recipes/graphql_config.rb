

cookbook_file '/home/vagrant/graphql-server/server/server.js' do
	source 'server.js'
	mode 0644
	owner 'root'
	group 'wheel'
end

cookbook_file '/home/vagrant/graphql-server/server/schema.js' do
	source 'schema.js'
	mode 0644
	owner 'root'
	group 'wheel'
end

cookbook_file '/home/vagrant/graphql-server/.babelrc' do
	source '.babelrc'
	mode 0644
	owner 'root'
	group 'wheel'
end

cookbook_file '/home/vagrant/graphql-server/bin/dev' do
	source 'dev'
	mode 0644
	owner 'root'
	group 'wheel'
end

cookbook_file '/home/vagrant/graphql-server/bin/production' do
	source 'production'
	mode 0644
	owner 'root'
	group 'wheel'
end



service "firewalld" do
	action [ :enable, :start]
end

bash 'open_port' do
	code <<-EOH
 	firewall-cmd --zone=public --add-port=80/tcp --permanent
	firewall-cmd --zone=public --add-port=8080/tcp --permanent
    firewall-cmd --zone=public --add-port=4000/tcp --permanent
	EOH
end

service "firewalld" do
	action :reload
end

