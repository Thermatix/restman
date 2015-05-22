
module Restman
	module Json_formatter

		def json_message message_type, type_data, message, merging={}
			msg = {message: message}
			msg.merge!(message_type => type_data) if message_type
			msg.merge(merging).to_json
		end

		def json_error type, message, merging={}
			json_message(:error, type, message,merging)
		end

		def json_success message, merging={}
			json_message(:success,'ActionSuccess',message,merging)
		end

		def json_data data,message='', merging={}
			json_success(message,{data: data}.merge(merging))
		end

	end
end