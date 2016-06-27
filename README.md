# ItamaeCoding
This repository is for code of Itamae.

To prepare servers automatically, I use Itamae.
As Sushi shokunin.

Provisioning to realize servers scaling.
I will prepare servers for apache+tomcat


So, I will write for example,,,
* adduser
* iptables
* selinux
* apache
* tomcat
..etc


Example code(itamae)
~~~
package 'httpd' do
  action :install
end
~~~
That's same as you write
~~~
yum install httpd
~~~


ということで、
サーバプロビジョニングとか、CIとか、infrastructure as codeとか、
慣れないけど頑張っていきましょい。
