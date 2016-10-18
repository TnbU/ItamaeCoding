# java.rb

# move jdk.rpm
remote_file "/root/jdk-8u102-linux-x64.rpm" do
  owner "root"
  group "root"
  mode "644"
  source "jdk-8u102-linux-x64.rpm"
  not_if "test -e /root/jdk-8u102-linux-x64.rpm"
end


# install jdk
execute "jdk install" do
 user "root"
 command "yum install -y /root/jdk-8u102-linux-x64.rpm"
end

# update jdk
execute "jdk update" do
 user "root"
 command "yum update -y /root/jdk-8u102-linux-x64.rpm"
end

