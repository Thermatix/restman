desc "Lists all the routes"
task :routes do
	require "#{$Lib_root}/restman/initializers/routes"

	routes = Restman::Routes.display

	m_uri = routes.group_by { |_,d| d[:uri].length }.max.first
	m_flags = routes.group_by { |_,d| d[:flags].length }.max.first
	m_name = routes.group_by { |n,_| n.length }.max.first

	format_string = ":%-#{m_name}s %#{m_uri}s %#{m_flags}s"

	routes = routes.map { |route,data|  format_string % ["#{route}","'#{data[:uri]}'","flags[#{data[:flags].join(',')}]"]}
	title = "routes"
	
	padd = ((routes.group_by(&:length).max.first - title.length) / 2) - 1
	padding = ( "-" * padd )
	title_padd = ( "-" * title.length )

	title = "#{padding}{#{title}}#{padding}-\n"
	line = "#{padding}-#{title_padd}-#{padding}-\n"
	p = ' ' * (padd - 2)
	puts line
	puts title
	puts line
	puts "name#{p}url#{p}flags"
	puts line
	puts routes.join("\n")
	puts line

end