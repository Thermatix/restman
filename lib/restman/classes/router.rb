module Restman
	class Routes
		class << self
			def define &scipt
				@routes ||= {}
				self.new.instance_eval(&scipt)
			end

			def get route
				@routes[route]
			end
		end

		def map name,route
			set_r(get_r.merge({ name => [route[:to],(route[:flags]||{})]}))
		end

		private

			def get_r
				self.class.instance_variable_get :@routes
			end

			def set_r value
				self.class.instance_variable_set(
						:@routes, 
						value
					)
			end
	end


 end