
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

		set :root, "#{File.expand_path(File.dirname(__FILE__))}"

		set :loggers, {
			log_path: '/var/log/restman',
			restman: '/var/log/restman/restman.log',
			db: '/var/log/restman/db.log',
			jobs: '/var/log/restman/jobs.log'
		}
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
