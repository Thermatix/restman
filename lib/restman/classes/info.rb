module Restman
	class Info_set
		if defined? Register_Self
			include Register_Self 
			register_component :info
		end
		
		module Singleton_Methods
			include Utils if defined? Utils 
							
			def [](key)
				@store[key]
			end

			def display
				@store.inspect
			end

			def generate_key
				o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
		        return (0...2048).map { o[rand(o.length)] }.join
			end

			private
				def set key, value
					@store[key] = value
				end
		end
		
		
		def self.inherited(base)
			base.instance_variable_set :@store, {}
			base.extend Singleton_Methods
		end

		def self.includes_hooks?
	    	%w(inherited)
		end
	end
end