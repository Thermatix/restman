
task :models do
	Dir["#{LIB_ROOT}/restman/models/*.rb"].each { |file| load file}
end

namespace :db do

	namespace :auto do
		
		desc "Perform auto-migration (reset your db data)"
		task migrate: :models do |t,_|
			puts "Auto-Migrating"
			DataMapper.auto_migrate!
			puts "#{t.name} done"
		end


		desc "Perform non descructive auto-migration"
		task upgrade: :models do |t,_|
			puts "Auto-Upgrading"
			DataMapper.auto_upgrade!
			puts "#{t.name} done"
		end

	end


	desc "create the database"
	task :create, [:repository] => :models do |t,args|
		repo 		= args[:repository]  || ENV['RESTMAN_REPOSITORY'] || :default
		config = DataMapper.repository(repo).adapter.options.symbolize_keys
		user 	 	= config[:user]
		password	= config[:password]
		host 		= config[:host]
		database 	= config[:database]  || config[:path].sub(/\//,"")
		charset  	= config[:charset] 	 || ENV['CHARSET']   		  || 'utf8'
		collation 	= config[:collation] || ENV['COLLATION'] 		  || 'utf8_unicode_cli'

		puts "Creating database: #{database}"

		case config[:adapter]
		when 'postgres'
			system( "createdb", "-E", charset, "-h", host, "-U", user, database)
		when 'mysql'
			system([
				"mysql", "--user=#{user}", (password.blank? ? '' : "--password=#{password}"), (%w{127.0.0.1 localhost}.include?(host) ? '-e' : "--host=#{host} -e"),
				"CREATE DATABASE #{database} DEFAULT CHARACTER SET #{charset} DEFAULT COLLATE #{collation}".inspect
			].compact.join(" "))
		when 'sqlite3'
			DataMapper.setup(DataMapper.repository.name, config)
		else
			raise "Adapter #{config[:adapter]} not supported for creating databases yet."
		end
		puts "#{t.name} done"
	end

	desc "Drops the database"
	task :drop, [:repository] => :models do |t,args|
		repo = args[:repository] || ENV['RESTMAN_REPOSITORY'] || :default
		config = DataMapper.repository(repo).adapter.options.symbolize_keys
		user 	 	= config[:user]
		password	= config[:password]
		host 		= config[:host]
		database 	= config[:database]  || config[:path].sub(/\//,"")

		puts "Dropping database: #{database}"

		case config[:adapter]
		when 'postgres'
			system("dropdb", "-h", host, "-U", user, database)
		when 'mysql'
			system([
				"mysql", "--user=#{user}", (password.blank? ? '' : "--password=#{password}"), (%w{127.0.0.1 localhost}.include?(host) ? '-e' : "--host=#{host} -e"),
				"DROP DATABASE IF EXISTS #{database}".inspect
			].compact.join(" "))
		when 'sqlite3'
			File.delete(config[:path]) if File.exist?(config[:path])
		else
			Raise "Adapter #{config[:adapter]} not supported for dropping databases yet."
		end
		puts "#{t.name} done"
	end

	desc "Create the database and migrate"
	task setup: [:create, 'auto:migrate']
	task reset: [:drop, :create, 'auto:migrate']


end