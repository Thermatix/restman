Restman::Routes.define do
	map :root, to: '/'

	namespace '/client' do
		map :jobs, to: '/jobs'
		map :new_jobs, to: '/new_jobs'
	end
end