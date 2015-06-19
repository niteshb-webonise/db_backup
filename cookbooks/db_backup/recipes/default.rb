# default recipe


execute "Create directory for sanity check script" do
command "mkdir -p #{node[:scripts]} "
end

case node['database']['type']

  when "mysql","MYSQL","Mysql"

	execute "Create backup directory for mysql" do
	command "mkdir -p #{node[:backup]}mysql"
	command "mkdir -p #{node[:backup_scripts][:target_directory]} "
	end

	template "/root/scripts/mysql_backup.sh" do
	  source "mysql_backup.sh.erb"
	  owner "root"
	  mode "0700"
	end

	cron "schedule sanity check sheet" do
	  hour node[:backup_scripts][:hour]
	  minute node[:backup_scripts][:minute]
	  command " sh /root/scripts/mysql_backup.sh >/var/log/mysql-backup.log 2>&1"
	end

 ## Scheduling  server sanity chech script
  
 	template "/root/scripts/server_sanity_check.sh" do
          source "mysql_apache.sh.erb"
	  owner "root"
	  mode "0700"
	 end

   when "Postgres","POSTGRES","postgres"
   
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


#   when "mongo","Mongo","MONGO"
#
#        template "/root/scripts/server_sanity_check.sh" do
#          source "mongo_apache.sh.erb"
#	  owner "root"
#	  mode "0700"
#        end
	
#	cron "schedule sanity check script" do
#        hour node[:script][:hour]
#        minute node[:script][:minute]
#        command " sh /root/scripts/server_sanity_check.sh > /var/log/server_sanity.log"
#        end

end
