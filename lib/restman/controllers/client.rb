module Restman
	class App < ::Sinatra::Base

		get :root do
			erb :client
		end

		namespace :client do

			get :all_jobs do
				erb :all_jobs, layout: false, locals: {jobs: Jobs.all}
			end

			get :new_jobs do
				erb :new_jobs,layout: false
			end

			namespace :modals do
				namespace :job do

					post :success do
						content = <<-CONTENT
							#{@params[:message]}. 
							You can continue to create a new job or go back to the Job Scheduler.
						CONTENT
						erb :modal, layout: false, locals: {content: content, modal_type: 'new_job_success', modal_target: 'response_modal'}
					end

					post :failed do
						content = <<-CONTENT
							#{@params[:message]}
						CONTENT
						erb :modal, layout: false, locals: {content: content, modal_type: 'new_job_failed', modal_target: 'response_modal'}
					end
					
				end
			end
			
		end

	end
end