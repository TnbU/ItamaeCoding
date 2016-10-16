execute 'disable SELinux' do
  user "root"
  command <<-EOS
    sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
#    setenforce 0
EOS
end
