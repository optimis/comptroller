module Comptroller
  class Practice
    include Her::Model
    use_api BILLING_API
    collection_path 'practices'

    #property :id, Serial
    #property :export_url, String, :required => true
    #property :billing, Boolean
    #property :external_id, Integer, :required => true
    #property :token, String

    def eql?(other)
      id          == other.id &&
      export_url  == other.export_url &&
      external_id == other.external_id &&
      token       == other.token
    end
  end
end
