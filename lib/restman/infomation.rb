
module Restman
	class Info < Info_set

		set :name, 'restman'
		set :version, "0.0.1"
		set :author, "Martin Becker"
		set :email, "mbeckerwork@gmail.com"
		set :summary, "Pull and Push, to and from, various api end points to a single destination"
		set :description, "Restman is an application with a Web interface that allows you to desginate API end 
			points to pull infomation from and then to push them to a endpoint location
		"

		set :homepage, ""
		set :license, ["MIT"]

			
		set :logfile, '/var/log/restman.log'
		set :db, { 
			in_mem: true,
		    adapter:  'adapter_name_here',
		    database: "path/to/repo",
		    username: 'username',
		    password: 'password',
		    host:     'hostname'
		}
		# set :key generate_key
  	end
end
