module Sinatra
	class Base
		
		[:get, :post, :put, :delete, :head, :options, :patch, :link, :unlink].each do |func_name|
			define_singleton_method func_name do |*args,&block|
				if args.first.class == Symbol
					super(Restman::Routes.get args.first,*block)
				else
					super(*args,*block)
				end
				
			end
		end

	end
end