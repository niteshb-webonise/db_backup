#
# Cookbook Name:: sanity
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "Create backup directory for mysql" do
command "mkdir -p #{node[:scripts]} "
end


#template "/root/scripts/server_sanity_check.sh" do
#  source "apache.sh.erb"
#  owner "root"
#  mode "0700"
#end


case node['database']['type']

  when "mysql","MYSQL","Mysql"

  template "/root/scripts/server_sanity_check.sh" do
          source "mysql_apache.sh.erb"
	  owner "root"
	  mode "0700"

        end
           
	cron "schedule mysql backup" do
  	hour node[:script][:hour]
  	minute node[:script][:minute]
  	command " sh /root/scripts/server_sanity_check.sh > /var/log/server_sanity.log"
	end


  when "mongo","Mongo","MONGO"

        template "/root/scripts/server_sanity_check.sh" do
          source "mongo_apache.sh.erb"
	  owner "root"
	  mode "0700"
	
        end
	
	cron "schedule mysql backup" do
        hour node[:script][:hour]
        minute node[:script][:minute]
        command " sh /root/scripts/server_sanity_check.sh > /var/log/server_sanity.log"
        end

end
