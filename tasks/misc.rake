desc "Lists all the routes"
task :routes do
	puts Restman::Routes.display
end