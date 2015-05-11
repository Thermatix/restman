
module Restman
	class App < ::Sinatra::Base
		get :root do 
			'hey'
		end
	end
end