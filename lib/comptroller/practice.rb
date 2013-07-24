module Comptroller
  class Practice
    include Her::Model
    collection_path 'practices'

    #property :id, Serial
    #property :export_url, String, :required => true
    #property :billing, Boolean
    #property :external_id, Integer, :required => true
    #property :token, String

    def eql?(other)
      id == other.id
    end
  end
end
