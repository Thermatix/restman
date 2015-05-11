module Restman
	module Active_jobs
		class Base < Info_set

  			def perform

  				self[:endpoints].each do |endpoint|
  					data[endpoint.to_sym] = Client.HttP.get "#{self[:base_uri]}#{self[:endpoint]}"
  				end
	  			Client.HttP.post self[:credentials].to_json, self[:destination]
  			end

  			def self.inherited(base)
  				base.required base_uri: String, endpoints: String, destination: String, credentials: Hash
  				base.include SuckerPunch::Job
				base.include FistOfFury::Recurrent
				
			end
		end
	end
end

