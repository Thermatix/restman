$Loading = [:base,:gems,:app]
$Loaded = []
$Loading_for = :app

load './restman.rb'
Rack::Handler::pick(['puma']).run Restman::App
