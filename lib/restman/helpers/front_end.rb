module Sinatra
	module Restman
		module Helpers
			 module Front

			 	def render(*args)
			        if args.first.is_a? Hash and args.first.keys.include? :partial
			          erb "_#{args.first[:partial]}".to_sym, layout: false, locals: args.first[:locals]
			        else
			          super
			        end
		      	end

		      	def url_for(root)
		      		::Restman::Routes.get(root.to_sym)[:uri]
		      	end

		      	def j_a?(active)
		      		if active
		      			"active"
		      		else
		      			"inactive"
		      		end
		      	end

		      	def get_jobs(where=nil)
		      		::Models::Jobs.all
		      	end
			 end
		end
	end
	register Restman::Helpers::Front
end