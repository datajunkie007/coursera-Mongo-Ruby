require 'mongo'
require 'pp'
require 'byebug'

Mongo::Logger.logger.level = ::Logger::DEBUG

class Solution

	@@db = nil
	
	def self.mongo_client
  		@@db = Mongo::Client.new('mongodb://localhost:27017')
  		@@db = @@db.use('test')
  	end	

  	def self.collection
  		self.mongo_client if not @@db
    	@@db[:zips]
  	end	

  	def sample
  		self.class.collection.find.first
  	end	

    def self.find id 
        Rails.logger.debug { "getting zip #{id}" }
        doc = collection.find(:_id=>id)
                        .projection({_id:true, city:true, state:true, pop:true})
                        .first
        return doc.nil? ? nil : Zip.new(doc)
    end
end


#byebug
db=Solution.mongo_client
#p db
zips=Solution.collection
#p zips
s=Solution.new
pp s.sample