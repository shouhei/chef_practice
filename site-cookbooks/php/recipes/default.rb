#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{php php-mbstring php-mysql php-gd}.each do |pkg|
  package pkg do
    action :install
    notifies :reload, 'service[httpd]'
  end
end

template "index.php" do
    path "/vagrant/index.php"
    owner "apache"
    group "apache"
    mode 0664
end
