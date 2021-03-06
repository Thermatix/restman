namespace :make do
	listing = [:remove_old_version,:build,:uninstall,:install]
	
	gem_name = "#{Restman::Info[:name]}-#{Restman::Info[:version]}.gem"
	gem_spec_name = "#{Restman::Info[:name]}.gemspec"
	
	desc 'delete gem file'
	task listing[0] do
		system "rm -f #{gem_name}"
	end

	desc 'build current working version of gem'
	task listing[1] do
		system "gem build #{gem_spec_name}"
	end

	desc 'uninstall gem for current working version'
	task listing[2] do	
		system "gem uninstall -x #{Restman::Info[:name]} -v #{Restman::Info[:version]}"
	end

	desc 'install current working version of gem'
	task listing[3] do
		system "gem install #{gem_name}"
	end


	desc 'run all tasks within this namespace'
	 task all: listing

end
