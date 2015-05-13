module Restman
	module Client
		class Http
			class << self
				attr_accessor :curl
			end

			def self.get url, keys
				Curl::Easy.perform(url) do |curl|
					curl.headers["User-Agent"] = "#{Restman::Info[:name]}-#{Restman::Info[:version]}"
				end.body_str
			end

			def self.post data,url
				headers ={
					'Content-Type' => 'application/json',
					'X-Requested-With' => 'XMLHttpRequest',
					'Accept' => 'application/json'
				}
				client = Curl::Easy.new
				client.url = url
				client.headers = headers
				client.http_post(payload)

			end
		end
	end
end