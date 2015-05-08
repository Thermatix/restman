module Restman
	module Models
		class Job < Base
			
  			property :name, String, required: true, lazy: [:desc]
  			property :description, Text, lazy: [:desc]
  			property :meta_infomation, Text, lazy: [:desc]

  			property :acces_key, BCryptHash, required: true, lazy: [:creds] 
  			property :acces_secret, BCryptHash, required: true, lazy: [:creds] 

  			property :base_api, URI, required: true, lazy: [:api]
  			property :api_endpoints, CommaSeparatedList, required: true, lazy: [:api] 
  			property :destination_endpoint, URI, required: true, lazy: [:api]

  			property :times, Integer, required: true, default: 5, lazy: [:sched] 
  			property :repetition, Enum[:second,:minute,:hour,:day,:week,:month], required: true, default: :minute, lazy: [:sched] 
		end
	end
end

