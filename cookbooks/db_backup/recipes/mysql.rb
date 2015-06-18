#
# Cookbook Name:: db_backup
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "Create backup directory for mysql" do
command "mkdir -p #{node[:backup]}mysql"
command "mkdir -p #{node[:backup_scripts][:target_directory]} "
end


template "/root/scripts/mysql_backup.sh" do
  source "mysql_backup.sh.erb"
  owner "root"
  mode "0700"
end 

cron "schedule mysql backup" do
  hour node[:backup_scripts][:hour]
  minute node[:backup_scripts][:minute]
  command " sh /root/scripts/mysql_backup.sh >/var/log/mysql-backup.log 2>&1"
end




