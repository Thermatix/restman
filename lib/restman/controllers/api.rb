module Restman
	class App < ::Sinatra::Base
		include Restman::Json_formatter

		namespace :api do

			#get job
			get :jobs do
				if get_params[:id]
					@job = Jobs.where(id: get_params[:id])	
				else
					@job = Jobs.all
				end
				if @job
					json_data @job.to_json
				else
					json_error 'JobGetError', "There was a problem getting the job infomation"
				end
			end

			#create job
			post :jobs do
				@job = Jobs.create(get_params)
				if @job.saved?
					json_data @job.to_json
				else
					json_error 'JobCreateError', "There was a problem trying to create the job"
				end
			end

			#update job
			put :jobs do
				@Jobs.update(get_params)
				if @jobs.saved?
					json_data @job.to_json
				else
					json_error 'JobUpdateError', "There was a problem trying to update the job"
				end
			end

			#destroy job

			delete :jobs do
				@job = Jobs.get(get_params[:id])
				if @job.destroy
					json_success 'The job was successfully deleted'
				else
					json_error 'JobDeleteError', 'There was a problem trying to delete the job '
				end
			end

			#get options
			options :jobs do
				response.headers["Allow"] = "GET,PUT,POST,DELETE,OPTIONS"
				response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
				200
			end

			

		end

		def get_params 
			@job_params ||= %w(id name description meta_infomation access_key access_secret base_uri endpoints destination times repetition).inject({}) do |result,attrib|
				result[attrib] = @params['jobs'][attrib] if @params['jobs'][attrib]
				result
			end

		end

	end
end