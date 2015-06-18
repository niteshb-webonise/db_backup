#
# Cookbook Name:: server_snapshot
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cron "schedule Snapshot backup" do
        hour node[:script][:hour]
        minute node[:script][:minute]
        command " sh /root/scripts/server_sanity_check.sh > /var/log/server_sanity.log"
        end


file "/opt/ec1-api-tool" do
  owner 'root'
  group 'root'
  mode 0755
  content ::File.open("/home/someService").read
  action :create
end
