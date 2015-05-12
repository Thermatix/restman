#setup restman logger
FileUtils.mkdir_p(Restman::Info[:loggers][:log_path]) unless File.directory?(Restman::Info[:loggers][:log_path])
Restman::Log.create Restman::Info[:name], Restman::Info[:loggers][:restman]