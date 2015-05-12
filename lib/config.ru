$Loading = [:base,:gems,:app]
$Loading_for = :app
puts File.expand_path('.')
load './restman.rb'
Rack::Handler::pick(['puma'])run Restman::App
