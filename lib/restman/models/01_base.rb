module Restman
	module Models
		class Base
			include DataMapper::Resource
  			@base_properties = {
  				id: [Serial],
  				created_at: [DateTime, default: DateTime.now],
  				updated_at: [DateTime, default: DateTime.now]
  			}
  			
  			def update
  				self.updated_at = DateTime.now
  				super
  			end

  			# module Singleton_Methods

  			# end
  			
			def self.inherited(base)
				# base.extend Singleton_Methods
				@base_properties.each do |key, data|
					base.property key,*data
				end

				after_inherited  do
					base.finalize
					base.auto_migrate!
				end
			end
		end
	end
end