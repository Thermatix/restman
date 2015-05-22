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

		      	def url_for(root,args=nil)
		      		route = ::Restman::Routes.get(root.to_sym)[:uri]
		      		if args
		      			route.gsub(/\:([a-zA-Z]*)/,"%{\\1}") % args #if any args are included then ALL  params for that route must be included
			      	else
			      		route.gsub(/\/\:[a-zA-Z]*/, "" ) #remove all traces of route params
			      	end
			      	 

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