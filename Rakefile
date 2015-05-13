# require 'erb'
$Lib_root ||= "#{File.expand_path('.')}/lib/"
$Loading = [:gems,:base,]
$Loading_for = :rake_tasks
#load libaries and environment(app info & initializers)
require  "#{$Lib_root}/restman"
require  "#{$Lib_root}/restman/infomation"
# Dir["#{$Lib_root}/restman/initializers/*.rb"].each { |file| load file}
#load rake tasks
Dir['tasks/*.rake'].sort.each { |file| load file }

APP_FILE = "#{$Lib_root}/restman/app"
APP_CLASS = 'Restman::App'

require 'sinatra/assetpack/rake'