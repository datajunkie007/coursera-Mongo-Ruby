class Zip
  # convenience method for access to client in console
  def self.mongo_client
   Mongoid::Clients.default
  end

  # convenience method for access to zips collection
  def self.collection
   self.mongo_client['zips']
  end
  
  # projection method to get filtered data
  def self.all
    collection.find
              .projection({_id:true, city:true, state:true, pop:true})
  end 
end