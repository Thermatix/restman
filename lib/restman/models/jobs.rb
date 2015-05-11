module Restman
	module Models
		class Jobs < Base
			
  			property :name, String, required: true, lazy: [:desc]
  			property :description, Text, lazy: [:desc]
  			property :meta_infomation, Text, lazy: [:desc]
  			property :active, Boolean, default: true

  			property :access_key, BCryptHash, required: true, lazy: [:creds] 
  			property :access_secret, BCryptHash, required: true, lazy: [:creds] 

  			property :base_uri, URI, required: true, lazy: [:api]
  			property :endpoints, CommaSeparatedList, required: true, lazy: [:api] 
  			property :destination, URI, required: true, lazy: [:api]

  			property :times, Integer, default: 5, lazy: [:sched] 
  			property :repetition, Enum[:second,:minute,:hour,:day,:week,:month], required: true, default: :minute, lazy: [:sched] 


  			def self.active?
  				all(active: true)
  			end

  			def generate_job
  				{
  					name: self.name.capitalize,
  					uris: {
  						base_uri: self.base_uri,
  						endpoints: self.endpoints,
  						destination: self.destination
  					},
  					recurs: {
  						repetition: self.repetition,
  						times: self.times
  					}
  				}

  			end
		end
	end
end

