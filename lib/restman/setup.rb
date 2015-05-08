Restman::Log.create Restman::INFO[:name], Restman::INFO[:logfile]
DataMapper::Logger.new($stdout, :debug)
case Restman::INFO[:db][:type]
	when :sql_mem
		DataMapper.setup(:default, 'sqlite::memory:')
	when :sql_pers
		DataMapper.setup(:default, Restman::INFO[:db][:connection])
	when :mysql
		DataMapper.setup(:default, Restman::INFO[:db][:connection])
	when :postgress
		DataMapper.setup(:default, Restman::INFO[:db][:connection])
end
