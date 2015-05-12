#setup suckerpunch
SuckerPunch.logger = Logger.new(Restman::Info[:loggers][:jobs])
#setup fist_of_futy
FistOfFury.configure do |config|
  config.utc = true 
end

#FistOfFury.attack!

