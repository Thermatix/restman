module Restman
	class Routes
		class << self
			def define &scipt
				@routes ||= {}
				self.new.instance_eval(&scipt)
			end

			def get route
				r = @routes[route]
				if r
					r
				else
					raise ArgumentError, "#{route.to_s} is not a valid route, please check routes with rake:routes" 
				end

			end

			def display
				@routes.sort
			end

		end

		def initialize
			@prefix = []
			@namespace_name = []
		end

		def namespace prefix, name=nil
			@namespace_name << name if name
			@prefix << prefix
			yield
			@namespace_name.pop if name
			@prefix.pop 

		end

		def map name,route
			set_r(get_r.merge({
					make_name(name) => {
						uri: make_uri(route[:to]), 
						flags: (route[:flags]||[]) 
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
				if @prefix.first
					"#{@prefix.join('')}#{uri}"
				else
					uri
				end
			end

			def make_name name
				if @namespace_name.first
					"#{@namespace_name.join('_')}_#{name}".to_sym
				else
					name
				end
			end
	end


 end