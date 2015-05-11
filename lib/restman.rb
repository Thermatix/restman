#phase 1 loading, load base code
LIB_ROOT ||=  "#{File.expand_path(File.dirname(__FILE__))}"
LOADING ||= []

puts LOADING

if LOADING.include?(:gems)
	require "rubygems"
	require "sinatra"
	require "data_mapper"
	require "dm-types"
	require "sucker_punch"
	require "json"
	require "curb"
	require 'fist_of_fury'
end


%w(patches classes ).each do |folder|
	Dir["#{LIB_ROOT}/restman/#{folder}/*.rb"].each { |file| load file}
end

if LOADING.include?(:app)
	require "#{LIB_ROOT}/restman/infomation"
	require "#{LIB_ROOT}/restman/setup"
	%w(base models controllers).each do |folder|
		Dir["#{LIB_ROOT}/restman/#{folder}/*.rb"].each { |file| load file}
	end
	require "#{LIB_ROOT}/restman/app"
end