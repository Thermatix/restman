#setup logger
Restman::Log.create Restman::Info[:name], Restman::Info[:logfile]
#setup DataMapper
DataMapper::Logger.new(Restman::Info[:logfile], :debug)

if Restman::Info[:db][:in_mem]
	DataMapper.setup(:default, 'sqlite::memory:')
else
	DataMapper.setup(:default, Restman::Info[:db])
end
#setup suckerpunch
SuckerPunch.logger = Restman::Log.logger
#setup fist_of_futy
FistOfFury.configure do |config|
  config.utc = true 
end

FistOfFury.attack!
