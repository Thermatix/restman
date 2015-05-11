#phase 1 loading, load base code
LIB_ROOT ||=  "#{File.expand_path(File.dirname(__FILE__))}"
LOADING ||= []


if LOADING.include?(:gems)
	puts 'Loading external libaries'
	require "rubygems"
	require "sinatra"
	require "data_mapper"
	require "dm-types"
	require 'dm-timestamps'
	require "sucker_punch"
	require 'fist_of_fury'
	require "json"
	require "curb"
end


%w(patches classes ).each do |folder|
	puts "loading base code"
	Dir["#{LIB_ROOT}/restman/#{folder}/*.rb"].each { |file| load file}
end

if LOADING.include?(:app)
	puts "loading app code"
	require "#{LIB_ROOT}/restman/infomation"
	require "#{LIB_ROOT}/restman/setup"
	%w(base models controllers).each do |folder|
		Dir["#{LIB_ROOT}/restman/#{folder}/*.rb"].each { |file| load file}
	end
	require "#{LIB_ROOT}/restman/app"
end