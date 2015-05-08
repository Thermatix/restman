module Restman
	class Info_set
		if defined? Register_Self
			include Register_Self 
			register_component :info
		end
		
		module Singleton_Methods

			def required list 
				@required = list
			end
			
			def check_for_required 
				if @required 
					@required.each do |key,type|
						test = self[key]
						klass = test.class
						raise ArgumentError, "Expected #{key} to be set" unless test
						if type 
							raise TypeError, "Expected #{key} to be of type #{type}, got #{klass}" unless klass == type
						end
					end
				end
			end
							
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
			after_inherited do
				base.check_for_required
			end
		end

		def self.includes_hooks?
	    	%w(inherited)
		end
	end
end