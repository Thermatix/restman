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

			def display
				@routes.to_s
			end

		end

		def initialize
			@prefix = nil
		end

		def namespace prefix
			@prefix = prefix
			yield
			@prefix = nil
		end

		def map name,route
			set_r(get_r.merge({
					name => {
						uri: make_uri(route[:to]), 
						flags: (route[:flags]||{}) 
						}
				}))
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

			def make_uri uri
				if @prefix
					"#{@prefix}/#{uri}"
				else
				uri
				end
			end
	end


 end