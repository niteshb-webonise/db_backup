
default[:project][:name] = "myproject"
default[:host] = "127.0.0.1"
default[:database][:name] = "test1"
default[:database][:user] = "final"
default[:database][:password] = "final"
default[:backup] = "/root/db_backup/"
default[:backup_scripts][:target_directory] = "/root/scripts/"
default[:backup_scripts][:hour] = "15"
default[:backup_scripts][:minute] = "10"
default[:rotation_days] = 10

