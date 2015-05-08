module Restman
	class Info < Info_set

		set :version, "0.0.1"
		set :name, 'restman'
		set :logfile, '/var/log/restman.log'
		set :db, {
			type: :sql_mem, #sql_mem, :sql_pers, :mysql, :postgress
			connection: '' #'sqlite:///path/to/project.db','mysql://user:password@hostname/database', 'postgres://user:password@hostname/database'
		}
		set :key generate_key
  	end
end
