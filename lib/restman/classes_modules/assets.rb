module Restman
	module Assets
		class << self
			attr_accessor :paths, :list
		end

		def self.included base
			base.class_exec(self.paths,self.list) do |paths,assets|
				configure do 
					register Sinatra::AssetPack
					assets do

						paths.each do |path|
							serve path[:to], from: path[:from]
						end

						assets.each do |asset|
							self.send asset[:type], asset[:name], asset[:paths]
						end
						
						js_compression :yui, :munge => true 
						css_compression :sass

					end
				end

			end
		end

	end

end