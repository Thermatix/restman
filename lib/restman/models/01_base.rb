module Restman
	module Models
		class Base
			include DataMapper::Resource
  			@base_properties = {
  				id: Serial,
  				created_at: DateTime
  			}
  			module Singleton_Methods
				def generate_key
					o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		          	return (0...32).map { o[rand(o.length)] }.join
		        end
  			end
  			
			def self.inherited(base)
				base.extend Singleton_Methods
				@base_properties.each do |key, type|
					base.property key,type
				end

				after_inherited  do
					base.finalize
					base.auto_migrate!
				end
			end
		end
	end
end