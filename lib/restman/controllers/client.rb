module Restman
	class App < ::Sinatra::Base

		get :root do
			erb :client
		end

		get :jobs do

		end

		get :new_jobs do

		end

		

	end
end