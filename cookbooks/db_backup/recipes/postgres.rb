#
# Cookbook Name:: db_backup
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute


execute "Create backup directory for postgres" do
command "mkdir -p #{node[:backup_scripts][:target_directory]} "
command "mkdir -p #{node[:backup]}postgres"
end


template "/root/scripts/postgres_backup.sh" do
  source "postgres_backup.sh.erb"
  owner "root"
  mode "0700"
end

cron "Schedule Postgres backup" do
  hour node[:backup_scripts][:hour]
  minute node[:backup_scripts][:minute]
  command " sh /root/scripts/postgres_backup.sh >/var/log/postgres-backup.log 2>&1"
end

