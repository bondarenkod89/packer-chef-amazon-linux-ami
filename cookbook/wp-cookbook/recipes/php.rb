#
# Cookbook:: wp-cookbook
# Recipe:: php
#
# Copyright:: 2019, The Authors, All Rights Reserved.

execute 'php7.2' do
    command <<-EOF
    yum update -y && yum upgrade -y
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum install epel-release yum-utils -y
    sudo yum-config-manager --enable epel
    sudo yum repolist
    yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
    yum-config-manager --enable remi-php72 -y
    EOF
end

yum_package %w{php72 php72-php-fpm php72-php-mysqlnd php72-php-xmlrpc php72-php-gd php72-php-pear php72-php-pspell} do
  action :install
  notifies :restart, 'service[httpd]', :immediately
end
