module Restman
	class App < ::Sinatra::Base

		get :root do
			erb :client
		end

		get :jobs do
			erb :jobs, layout: false
		end

		get :new_jobs do
			erb :new_jobs,layout: false
		end

		

	end
end