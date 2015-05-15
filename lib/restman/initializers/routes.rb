Restman::Routes.define do
	map :root, to: '/'

	namespace '/client', :client do
		namespace '/render' do
			
			map :all_jobs, to: '/all_jobs'
			map :new_jobs, to: '/new_jobs'

			namespace '/partials', :partials do
				map :jobs, to: '/job'
			end

		end
	end

	namespace '/api', :api do
		namespace '/v1' do
			map :jobs, to: '/jobs'
		end
	end
	
end