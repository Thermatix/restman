Restman::Routes.define do
	map :root, to: '/'

	namespace '/client', :client do
		namespace '/render' do
			
			map :all_jobs, to: '/all_jobs'
			map :new_jobs, to: '/new_jobs'
			namespace '/modals', :modals do
				namespace '/job', :job do
					map :success, to: '/success'
					map :failed, to: '/failed'
				end
				
			end

			namespace '/partials', :partials do
				map :jobs, to: '/job'
			end

		end
	end

	namespace '/api', :api do
		namespace '/v1' do
			map :jobs, to: '/jobs/:id'
		end
	end
	
end