# firewalld stop
service 'firewalld' do
  action [:stop]
end

# firewalld start
service 'firewalld' do
  action [:start]
end


execute "add firewalld public http" do
  user "root"
  command "firewall-cmd --add-service=http --zone=public --permanent"
end



service "firewalld" do
  action :stop
end

# firewalld autoStart-on and service firewalld start
service 'firewalld' do
  action [:enable, :start] 
end



