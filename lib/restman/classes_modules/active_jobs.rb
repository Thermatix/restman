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
	end
end

