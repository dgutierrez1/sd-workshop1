service "httpd" do
	action [ :enable, :start]
end

service "firewalld" do
	action [ :enable, :start]
end

bash 'open_port' do
	code <<-EOH
	firewall-cmd --zone=public --add-port=80/tcp --permanent
	EOH
end

service "firewalld" do
	action :reload
end

service "httpd" do
	action:restart
end

