module Restman
	class App < ::Sinatra::Base
		
		@client = {
			navigation: [
				{
					name: 'jobs',
					request: 'jobs'
				},
				{
					name: 'New Job',
					request: 'new_jobs'
				}
			]
		}

		get :root do
			erb :clilent
		end

	end
end