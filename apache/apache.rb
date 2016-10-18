# apache.rb

# install apache
package "httpd" do
end

# update apache
execute "apache update" do
 user "root"
 command "yum update -y httpd"
end

# apache autoStart-on and service httpd start
service 'httpd' do
  action [:enable, :start] 
end

# make index.html
remote_file "/var/www/html/index.html" do
  owner "root"
  group "root"
  mode "644"
  source "index.html"
  not_if "test -e /var/www/html/index.html"
end

# make error.html...display where error for example 404...
remote_file "/var/www/html/error.html" do
  owner "root"
  group "root"
  mode "644"
  source "error.html"
  not_if "test -e /var/www/html/error.html"
end

# make error.conf...This is to config what displaying when error
remote_file "/etc/httpd/conf.d/error.conf" do
  owner "root"
  group "root"
  mode "644"
  source "error.conf"
  not_if "test -e /etc/httpd/conf.d/error.conf"
end


# remove default conf file.
execute "remove autoindex.conf" do
  user "root"
  only_if "test -e /etc/httpd/conf.d/autoindex.conf"
  command "mv -f /etc/httpd/conf.d/autoindex.conf /etc/httpd/conf.d/autoindex.conf.org"
end

# remove default conf file.
execute "remove userdir.conf" do
  user "root"
  only_if "test -e /etc/httpd/conf.d/userdir.conf"
  command "mv -f /etc/httpd/conf.d/userdir.conf /etc/httpd/conf.d/userdir.conf.org"
end

# remove default conf file.
execute "remove welcome.conf" do
  user "root"
  only_if "test -e /etc/httpd/conf.d/welcome.conf"
  command "mv -f /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.org"
end



# httpd.conf(update)
execute 'httpd.confupdate' do
  user "root"
  command <<-EOS
    sed -i 's/ServerSignature On/ServerSignature Off/g' /etc/httpd/conf/httpd.conf
    sed -i 's/ServerTokens OS/ServerTokens Prod/g' /etc/httpd/conf/httpd.conf
EOS
end

# httpd.conf(add ETag)
execute 'httpd.confupdate Etag' do
  user "root"
  not_if "cat /etc/httpd/conf/httpd.conf | grep ETag"
  command <<-EOS
    echo "# FileETag" >> /etc/httpd/conf/httpd.conf
    echo "FileETag None" >> /etc/httpd/conf/httpd.conf
    echo "" >> /etc/httpd/conf/httpd.conf    
EOS
end

# httpd.conf(add Traceoff)
execute 'httpd.confupdate trace' do
  user "root"
  not_if "cat /etc/httpd/conf/httpd.conf | grep TraceEnable"
  command <<-EOS
    echo "# TraceEnable" >> /etc/httpd/conf/httpd.conf
    echo "TraceEnable Off" >> /etc/httpd/conf/httpd.conf
    echo "" >> /etc/httpd/conf/httpd.conf
EOS
end

# httpd.conf(add XFRAMEOPTIONS)
execute 'httpd.confupdate XFRAME' do
  user "root"
  not_if "cat /etc/httpd/conf/httpd.conf | grep SAMEORIGIN"
  command <<-EOS
    echo "# XFAMEOPTIONS" >> /etc/httpd/conf/httpd.conf
    echo "Header append X-FRAME-OPTIONS \"SAMEORIGIN\"" >> /etc/httpd/conf/httpd.conf
    echo "" >> /etc/httpd/conf/httpd.conf
EOS
end


# IF SSL
# -SSLV2 , SSLv3,
#SSLCipherSuite



# apache stop
service 'httpd' do
  action [:stop]
end

# apache start
service 'httpd' do
  action [:start]
end
