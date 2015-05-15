module Restman
	module Patches
		module String
			def constantize(class_name)
			  unless /\A(?:::)?([A-Z]\w*(?:::[A-Z]\w*)*)\z/ =~ self
			    raise NameError, "#{class_name.inspect} is not a valid constant name!"
			  end

			  Object.module_eval("::#{$1}", __FILE__, __LINE__)
			end

		end
	end
end
String.prepend Restman::Patches::String