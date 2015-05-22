module Restman
	module Models
		class Jobs
      attr_accessor :statics
        include ::DataMapper::Resource

        def initialize attributes
          super
          self.statics = {
            type: 'job',
            id: self.id
          }
        end

        property :id, Serial
        property :created_at, DateTime
        property :updated_at, DateTime
        property :active, Boolean, default: true
			
  			property :name, String, required: true, lazy: [:desc]
  			property :description, Text, lazy: [:desc]
  			property :meta_infomation, Text, lazy: [:desc]
  			

  			property :access_key, BCryptHash, required: true, lazy: [:creds] 
  			property :access_secret, BCryptHash, required: true, lazy: [:creds] 

  			property :base_uri, URI, required: true, lazy: [:api]
  			property :endpoints, CommaSeparatedList, required: true, lazy: [:api] 
  			property :destination, URI, required: true, lazy: [:api]

  			property :times, Integer, default: 5, lazy: [:sched] 
  			property :repetition, Enum[:second,:minute,:hour,:day,:week,:month], required: true, default: :minute, lazy: [:sched] 

  			def self.active?
  				all(active: true)
  			end

  			def generate_job
  				{
  					name: self.name.capitalize,
  					uris: {
  						base_uri: self.base_uri,
  						endpoints: self.endpoints,
  						destination: self.destination
  					},
  					recurs: {
  						repetition: self.repetition,
  						times: self.times
  					}
  				}
          
  			end

        def to_json
          %w(name description meta_infomation access_key access_secret base_uri endpoints destination times repetition).map(&:to_sym).inject({}) do |result,attrib|
            data = self.send(attrib)
            result[:attributes][attrib] = data if data
            result
          end.merge(self.statics)
        end

        if DataMapper.repository(:default).adapter.storage_exists?('restman_models_jobs') == false
          auto_migrate!
        else
          auto_upgrade!
        end
		end
	end
end


