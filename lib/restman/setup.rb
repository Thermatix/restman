#setup logger
Restman::Log.create Restman::INFO[:name], Restman::INFO[:logfile]
#setup DataMapper
DataMapper::Logger.new(Restman::INFO[:logfile], :debug)

if Restman::INFO[:db][:in_mem]
	DataMapper.setup(:default, 'sqlite::memory:')
else
	DataMapper.setup(:default, Restman::INFO[:db])
end
#setup suckerpunch
SuckerPunch.logger = Logger.new(Restman::INFO[:logfile])
#setup fist_of_futy
FistOfFury.configure do |config|
  config.utc = true 
end

FistOfFury.attack!
