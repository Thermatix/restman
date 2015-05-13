
module Restman
	class App < ::Sinatra::Base

		Info = Restman::Info
		configure  do
			set :show_exceptions, true
			puts Info[:root]
			set :root, Info[:root]
			set :threaded, true

			set :server, :puma
			Tilt.register Tilt::ERBTemplate, 'html.erb'

			enable :logging
			use Rack::CommonLogger, Log.file

			if ENV['JG_APPLICATION_NAME']
				set :environment, :production
				set :bind, '0.0.0.0', HOST
				set :show_exceptions, false
			end
		end

		include Restman::Assets

		helpers Sinatra::FormHelpers
		# helpers Sinatra::JSON
		helpers Sinatra::Restman::Helpers::Front
		helpers Sinatra::Restman::Helpers::Back



		# helpers Sinatra.const_get("GG_Web_#{C_NAME}")::Helpers
		# register Sinatra.const_get("GG_Web_#{C_NAME}")::Api
		# register Sinatra.const_get("GG_Web_#{C_NAME}")::Actions

	end
end