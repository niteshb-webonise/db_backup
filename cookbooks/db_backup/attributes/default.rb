
default[:project][:name] = "IC"
default[:database][:name] = "ifaf"
default[:database][:user] = "ifaf"
default[:database][:password] = "postgres@ifaf"


default[:backup_directory] = "/root/db_backup/"
default[:backup_scripts][:target_directory] = "/root/scripts/"
default[:backup_scripts][:hour] = "10"
default[:backup_scripts][:minute] = "30"
default[:backup_scripts][:retention_days] = 15

