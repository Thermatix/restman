module Restman
	module Patches
		module Hash
			def except!(*keys)
			    keys.each { |key| delete(key) }
			    self
			  end
		end
	end
end

Hash.prepend Restman::Patches::Hash