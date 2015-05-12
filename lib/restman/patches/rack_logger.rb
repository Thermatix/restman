=begin
if defined? Rack::CommonLogger
	module Restman
		module Patches
			module Rack_CommonLogger_Patch

				FORMAT = %{%s - %s [%s] "%s %s%s %s" %d %s %0.4f\n}

			    def log(env, status, header, began_at)
			    	now = Time.now
			    	length = extract_content_length(header)

			      	msg = FORMAT % [
				        env['HTTP_X_FORWARDED_FOR'] || env["REMOTE_ADDR"] || "-",
				        env["REMOTE_USER"] || "-",
				        now.strftime("%d/%b/%Y:%H:%M:%S %z"),
				        env[REQUEST_METHOD],
				        env[PATH_INFO],
				        env[QUERY_STRING].empty? ? "" : "?"+env[QUERY_STRING],
				        env[HTTP_VERSION],
				        status.to_s[0..3],
				        length,
				        now - began_at 
				    ]

				    puts msg.class
			    	puts msg
			   		::Restman::Log[:info] = msg

			    end

			end
	  	end
	end
	  ::Rack::CommonLogger.prepend Restman::Patches::Rack_CommonLogger_Patch
end
=end