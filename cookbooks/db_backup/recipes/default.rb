# default recipe


include_recipe "db_backup::mysql"
include_recipe "db_backup::postgres"


#include_recipe "db_backup::mysql"
#include_recipe "db_backup::postgres"















#execute "Create backup directory for mysql" do
#command "mkdir -p #{node[:backup_scripts][:target_directory]} "
#command "mkdir -p #{node[:backup]}mysql"
#end


