require 'erb'
LIB_ROOT ||= "#{File.expand_path('.')}/lib/"
$Loading = [:gems,:base]
$Loading_for = :rake_tasks
#load libaries and environment(app info & initializers)
require  "#{LIB_ROOT}/restman"
require  "#{LIB_ROOT}/restman/infomation"
Dir["#{LIB_ROOT}/restman/initializers/*.rb"].each { |file| load file}
#load rake tasks
Dir['tasks/*.rake'].sort.each { |file| load file }

