
# This file is to include recipe what you wanna execute.
# Please include recipe!

# config iptables
include_recipe "iptables/iptables.rb"

# apache
include_recipe "apache/apache.rb"

# selinux
include_recipe "selinux/selinux.rb"

# useradd
# include_recipe "useradd/useradd.rb





