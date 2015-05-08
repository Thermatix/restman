module Restman
	module Active_jobs

		self << class
			attr_accessor :active
		end

		def self.create job
			Object.const_set job[:name], Class.new(Base) do
				job[:uris].each do |name,value|
					set name, value
				end
				self.class_eval "recurs { #{job[:recurs][:repetition]}ly(#{job[:recurs][:times]}) }"
			end
		end

		class Base < Info_set


			required { base_uri: String, endpoints: String, destination: String, credentials: Hash}

  			self.active  ||= []
  			
  			def perform

  				self[:endpoints].each do |endpoint|
  					data[endpoint.to_sym] = Client.HttP.get "#{self[:base_uri]}#{self[:endpoint]}"
  				end
	  			Client.HttP.post self[:credentials].to_json, self[:destination]
  			end

  			def self.inherited(base)
  				base.include SuckerPunch::Job
				base.include FistOfFury::Recurrent
				Active_jobs.active << base
			end
		end
	end
end

#list of current active jobs
#

