# tomcat.rb

# remote apache-tomcat-8.5.6.tar.gz
remote_file "/root/apache-tomcat-8.5.6.tar.gz" do
  owner "root"
  group "root"
  mode "644"
  source "apache-tomcat-8.5.6.tar.gz"
  not_if "test -e /root/apache-tomcat-8.5.6.tar.gz"
end



# tomcat install
execute 'tomcat install' do
  user "root"
  not_if "ls /usr/local/tomcat/"
  command <<-EOS
    tar xvzf /root/apache-tomcat-8.5.6.tar.gz
    mv -f /root/apache-tomcat-8.5.6 /usr/local/
    ln -s /usr/local/apache-tomcat-8.5.6/ /usr/local/tomcat
EOS
end


#設定ファイル配置（setenv , tomcat-user.xml)
# remote apache-tomcat-8.5.6.tar.gz
remote_file "/usr/local/tomcat/bin/setenv.sh" do
  owner "root"
  group "root"
  mode "755"
  source "setenv.sh"
  not_if "test -e /usr/local/tomcat/bin/setenv.sh"
end

remote_file "/usr/local/tomcat/conf/tomcat-users.xml" do
  owner "root"
  group "root"
  mode "600"
  source "tomcat-users.xml"
end

remote_file "/usr/local/tomcat/webapps/manager/META-INF/context.xml" do
  owner "root"
  group "root"
  mode "600"
  source "context.xml"
end


execute 'useradd tomcat' do
  user "root"
  not_if "id tomcat"
  command <<-EOS
    useradd tomcat
    passwd -S tomcat
EOS
end

execute 'chown' do
  user "root"
  command <<-EOS
    chown -R tomcat:tomcat /usr/local/tomcat/
EOS
end

execute 'tomcat start' do
  user "root"
  not_if "ps  aux | grep java | grep -v grep"
  command <<-EOS
    sudo -u tomcat /usr/local/tomcat/bin/startup.sh
EOS
end


