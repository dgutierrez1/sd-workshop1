service "mongod" do
	action [ :enable, :start]
end

execute 'server_init' do
  command 'babel /home/vagrant/graphql-server/index.js'
end