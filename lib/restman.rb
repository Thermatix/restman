#phase 1 loading, load base code
LIB_ROOT ||=  "#{File.expand_path(File.dirname(__FILE__))}"
$Loaded ||=[]
if $Loading.include?(:gems) and not $Loaded.include?(:gems)
	puts "Loading external libraries for #{$Loading_for}"
	#core
	require "rubygems"
	require 'fileutils'
	require "json"
	require "curb"
	require "sinatra/base"
	require "data_mapper"
	require "sucker_punch"
	
	#Sinatra pluguins
	require 'sinatra/form_helpers'
	require 'sinatra/namespace'
	require 'sinatra/json'

	#Data_Mapper plugins
	require "dm-types"
	require 'dm-timestamps'

	#Sucker_Punch plugins
	require 'fist_of_fury'

	$Loaded << :gems
end

if $Loading.include?(:base) and not $Loaded.include?(:base)
	puts "Loading base code for #{$Loading_for}"
	%w(patches classes ).each do |folder|		
		Dir["#{LIB_ROOT}/restman/#{folder}/*.rb"].each { |file| load file}	
	end
	$Loaded << :base
end


if $Loading.include?(:app) and not $Loaded.include?(:app)
	puts "Loading app code for #{$Loading_for}"
	require "#{LIB_ROOT}/restman/infomation"
	%w(initializers base models controllers helpers).each do |folder|
		Dir["#{LIB_ROOT}/restman/#{folder}/*.rb"].each { |file| load file}
	end
	require "#{LIB_ROOT}/restman/app"
	::DataMapper.finalize
	$Loaded << :app
end