#phase 1 loading, load base code
require "rubygems"
require "sinatra"
require "datamapper"
require "dm-types"
require "sucker_punch"
require "json"
require "curb"

%w(monkey_patches classes).each do |folder|
	Dir["./restman/#{folder}/*.rb"].each { |file| require file 	}
end

#phase 2 load app code
require './restman/infomation'
require './restman/setup'
%w(models routes).each do |folder|
	Dir["./restman/#{folder}/*.rb"].each { |file| require file 	}
end

module Restman
  
end
