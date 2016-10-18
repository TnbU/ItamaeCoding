
# This file is to include recipe what you wanna execute.
# Please include recipe!

# config firewalld
include_recipe "firewalld/firewalld.rb"

# apache
include_recipe "apache/apache.rb"

# selinux
#include_recipe "selinux/selinux.rb"


# java
include_recipe "java/java.rb"

# tomcat
include_recipe "tomcat/tomcat.rb"


# useradd
# include_recipe "useradd/useradd.rb





