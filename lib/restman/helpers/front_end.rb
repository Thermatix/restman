module Sinatra
	module Restman
		module Helpers
			 module Front

			 	def render(*args)
			        if args.first.is_a?(Hash) && args.first.keys.include?(:partial)
			          erb "_#{args.first[:partial]}".to_sym, :layout => false
			        else
			          super
			        end
		      	end

		      	def url_for(root)
		      		::Restman::Routes.get(root)[:uri]
		      	end

			 end
		end
	end
	register Restman::Helpers::Front
end