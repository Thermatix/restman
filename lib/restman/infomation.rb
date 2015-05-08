module Restman
	class Info < Info_set
		
		set :name, 'restman'
		set :version, "0.0.1"
		set :author, "Martin Becker"
		set :email, "mbeckerwork@gmail.com"
		set :summary, "Pull and Push to and from various api end points to a single destination endpoint"
		set :description, <<-DESC
		DESC
		set :homepage, ""
		set :license, ""

		
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
