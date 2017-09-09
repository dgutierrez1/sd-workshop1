service "mongod" do
	action [ :enable, :start]
end

execute 'server_init' do
  command 'npm run production --prefix /home/vagrant/graphql-server/ '   

end