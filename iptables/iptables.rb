execute "remove iptables" do
  user "root"
  command "rm -f /etc/sysconfig/iptables"
end

remote_file "/etc/sysconfig/iptables" do
  owner "root"
  group "root"
  mode "644"
  source "iptables"
end

service "iptables" do
  action :stop
end

service "iptables" do
  action :start
end


