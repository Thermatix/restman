module Restman
	module Active_jobs
		class Base < Info_set

			self << class
				attr_accessor :active
			end
			#:name

			required { base_uri: String, endpoints: String, destination: String}

  			self.active  ||= []
  			
  			def perform
  				data = {}
  				self[:endpoints].each do |endpoint|
  					data[endpoint.to_sym] = Client.HttP.get "#{self[:base_uri]}#{self[:endpoint]}"
  				end
	  				Client.HttP.post data.to_json, self[:destination]
  			end

  			def self.inherited(base)
  				base.include SuckerPunch::Job
				base.include FistOfFury::Recurrent
				self.active << base
			end
		end
	end
end

#list of current active jobs
#

