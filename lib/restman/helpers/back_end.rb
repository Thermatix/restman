module Sinatra
	module Restman
		module Helpers
			 module Back

				# def logged_in(key)
				# 	Store.find(key) ? true : false
				# end

				# def check_for_login(key = nil)
				# 	content_type :json
				# 	if logged_in(key)
				#   		{redirect: 'encrypt'}.to_json
				# 	else
				# 	 	{redirect: 'login'}.to_json
				# 	end
				# end

				def get_job_params 
					@job_params ||= %w(id name description meta_infomation access_key access_secret base_uri endpoints destination times repetition).inject({}) do |result,attrib|
						result[attrib] = @params['jobs'][attrib] if @params['jobs'][attrib]
						result
					end
				end

			end
		end
	end
	register Restman::Helpers::Back
end