
module Restman
	module Json_formatter
		module Singleton_Methods

			def json_message message_type=nil, type_data=nil, message
				msg = {message: message}
				msg.merge!(message_type => type_data) if message_type
				msg.to_json
			end

			def json_error type, message
				json_message(:error, type, message)
			end

			def json_success message
				json_message(:success,'ActionSuccess',message)
			end

			def json_data data
				{data: data}.to_json
			end

		end


		def self.included base
			base.include Singleton_Methods
		end
	end
end