#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "httpd" do
    action :install
end

template "httpd.conf" do
    path "/etc/httpd/conf/httpd.conf"
    owner "root"
    group "root"
    mode 0644
    notifies :reload, 'service[httpd]'
end

template "php-sample.conf" do
    path "/etc/httpd/conf.d/php-sample.conf"
    owner "root"
    group "root"
    mode 0644
    notifies :reload, 'service[httpd]'
end

service "httpd" do
    action [:enable, :start]
end
