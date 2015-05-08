require "bundler/gem_tasks"

task :post_install do
	require 'rbconfig'
	include Config

	case CONFIG['host_os']
	   when /linux/i
	      apt_get = system "apt-get -v"
	      if apt_get or system "yum -v"
	      	if apt_get
	      		exec <<-SCRIPT 
	      		sudo apt-get install libsqlite3-dev
	      		sudo apt-get install libmysqlclient-dev
	      		sudo apt-get install curl
	      		SCRIPT
	      	else
	      		exec <<-SCRIPT
	      		sudo yum install sqlite-devel 
	      		sudo yum install mysql-devel
	      		sudo yum install curl
	      		SCRIPT
	      	end
	      else
	      	raise InvalidOSError
	      end 
	   when  /darwin/i
	   		homebrew = system "brew -v"
	   		if homebrew or system "port -v"
	   			if homebrew
	   				exec <<-SCRIPT 
	   				sudo brew install sqlite 
	   				sudo brew install mysql
	   				sudo brew curl
	   				SCRIPT
	   			else
	   				exec <<-SCRIPT 
	   				sudo port install sqlite3 
	   				sudo port install mysql5
	   				sudo port install curl
	   				SCRIPT
	   			end
	   		else
	   			puts 'Homebrew or Macports not installed, can't install dependencies
	   		end
	   else
	     raise InvalidOSError
	end

end
