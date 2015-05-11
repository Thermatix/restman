if defined? Sinatra::Base	
	module Restman
		module Patches
			module Sinatra_Base_Patch			
				[:get, :post, :put, :delete, :head, :options, :patch, :link, :unlink].each do |func_name|
					define_method func_name do |*args,&block|
						if args.first.class == Symbol
							super(Restman::Routes.get(args.first),*block)
						else
							super(*args,*block)
						end
						
					end
				end
			end
		end
	end
	::Sinatra::Base.prepend Restman::Patches::Sinatra_Base_Patch
end