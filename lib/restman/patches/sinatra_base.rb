if defined? Sinatra::Base	
	module Restman
		module Patches
			module Sinatra_Base

				def namespace name
					insure_namespace					
					@namespace_name << name
					yield
					@namespace_name.pop
				end
				[:get, :post, :put, :delete, :head, :options, :patch, :link, :unlink].each do |func_name|
					define_method func_name do |path,opts={},&block|
						if path.class == Symbol				
							super(Restman::Routes.get(make_name(path))[:uri],opts={},&block) #do
						else
							super(path,opts,&block)
						end		
					end
				end

				def make_name path
					insure_namespace
					if @namespace_name.first
						"#{@namespace_name.join('_')}_#{path}".to_sym
					else
						path
					end
				end

				def insure_namespace
					@namespace_name ||= []
				end

			end
		end
	end
	::Sinatra::Base.singleton_class.prepend Restman::Patches::Sinatra_Base
end