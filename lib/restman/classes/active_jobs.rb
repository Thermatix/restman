module Restman
	module Active_jobs

		class << self
			attr_accessor :active
		end

		self.active ||= []

		def self.create job
			self.active << Object.const_set(job[:name], Class.new(Base) do
				job[:uris].each do |name,value|
					set name, value
				end
				self.class_eval "recurs { #{job[:recurs][:repetition]}ly(#{job[:recurs][:times]}) }"
			end)
		end

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

#list of current active jobs
#

