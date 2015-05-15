#setup DataMapper
DataMapper::Logger.new(Restman::Info[:loggers][:db], :debug)

if Restman::Info[:db][:in_mem]
	DataMapper.setup(:default, 'sqlite::memory:')
else
	DataMapper.setup(:default, Restman::Info[:db][:connection])
end