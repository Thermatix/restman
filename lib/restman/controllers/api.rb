module Restman
	class App < ::Sinatra::Base
		include Restman::Json_formatter

		namespace :api do

			#get job
			get :jobs do
				content_type :json
				if get_job_params[:id]
					@jobs = Jobs.where(id: get_job_params[:id])	
				else
					@jobs = Jobs.all
				end
				if @jobs
					json_data @jobs.to_json,"#{@jobs.length} jobs successfully gotten" , {links:{modal: url_for(:client_modals_job_success)}}
				else
					json_error 'JobGetError', "There was a problem getting the job infomation", {links:{modal: url_for(:client_modals_job_failed)}}
				end
			end

			#create job
			post :jobs do
				content_type :json
				@job = Jobs.create(get_job_params)
				if @job.saved?
					json_data @job.to_json, "#{@job.name} was successfully created" ,{links:{modal: url_for(:client_modals_job_success)}}
				else
					json_error 'JobCreateError', "There was a problem trying to create the job", {links:{modal: url_for(:client_modals_job_failed)}}
				end
			end

			#update job
			put :jobs do
				content_type :json
				@Jobs.update(get_job_params)
				if @jobs.saved?
					json_data @job.to_json,"#{@job.name} was successfully updated", {links:{modal: url_for(:client_modals_job_success)}}
				else
					json_error 'JobUpdateError', "There was a problem trying to update the job", {links:{modal: url_for(:client_modals_job_failed)}}
				end
			end

			#destroy job

			delete :jobs do
				content_type :json
				@job = Jobs.get(get_job_params[:id])
				name = Job.name
				if @job.destroy
					json_success "#{name} was was successfully deleted", {links:{modal: url_for(:client_modals_job_success)}}
				else
					json_error 'JobDeleteError', 'There was a problem trying to delete the job ', {links:{modal: url_for(:client_modals_job_failed)}}
				end
			end

			#get options
			options :jobs do
				response.headers["Allow"] = "GET,PUT,POST,DELETE,OPTIONS"
				response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
				200
			end

			

		end

		

	end
end