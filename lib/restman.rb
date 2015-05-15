#phase 1 loading, load base code
$Lib_root ||=  "#{File.expand_path(File.dirname(__FILE__))}"
$Loaded ||=[]
puts "loading for #{$Loading_for}"
if $Loading.include?(:gems) and not $Loaded.include?(:gems)
	puts 'loading libs'
	#un-grouped
	require "rubygems"
	require 'fileutils'
	require "json"
	require "curb"

	
	#job-system
	require "sucker_punch"
	require 'fist_of_fury'

	#sinatra
	require "sinatra/base"
	require 'sinatra/form_helpers'
	require 'sinatra/assetpack'
	require 'sinatra/json'

	#assets
	require "yui/compressor"
	require "sass"

	#datamapper
	require "data_mapper"
	require "dm-types"
	require 'dm-timestamps'

	$Loaded << :gems
end



if $Loading.include?(:base) and not $Loaded.include?(:base)
	puts 'loading base'
	%w(patches classes_modules ).each do |folder|		
		Dir["#{$Lib_root}/restman/#{folder}/*.rb"].each { |file| load file}
	end
	$Loaded << :base
end


if $Loading.include?(:app) and not $Loaded.include?(:app)
	puts 'loading app'
	require "#{$Lib_root}/restman/infomation"
	%w(initializers base models controllers helpers).each do |folder|
		Dir["#{$Lib_root}/restman/#{folder}/*.rb"].each { |file| load file}
	end
	require "#{$Lib_root}/restman/app"
	::DataMapper.finalize
	$Loaded << :app
end

