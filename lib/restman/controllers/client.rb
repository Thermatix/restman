module Restman
	class App < ::Sinatra::Base

		get :root do
			erb :client
		end

		namespace :client do

			get :all_jobs do
				@jobs = Jobs.all
				erb :all_jobs, layout: false, locals: {jobs: @jobs}
			end

			get :new_jobs do
				erb :new_jobs,layout: false
			end
			
		end

	end
end