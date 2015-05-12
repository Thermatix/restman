if defined? Sinatra::Base	
	module Restman
		module Patches
			module Sinatra_Base_Patch			
				[:get, :post, :put, :delete, :head, :options, :patch, :link, :unlink].each do |func_name|
					define_method func_name do |path,opts={},&block|
						if path.class == Symbol
							super(Restman::Routes.get(path)[:uri],opts={}) do
								block.call
							end
						else
							super(path,opts) do
								block.call
							end
						end
						
					end
				end
			end
		end
	end
	::Sinatra::Base.singleton_class.prepend Restman::Patches::Sinatra_Base_Patch
end