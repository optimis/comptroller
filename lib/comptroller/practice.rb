module Comptroller
  class Practice
    include Her::Model
    use_api BILLING_API
    collection_path 'practices'
    include_root_in_json true

    attributes :export_url, :token, :external_id
    validates :export_url, :token, :external_id, :presence => true

    def eql?(other)
      export_url  == other.export_url &&
      external_id == other.external_id &&
      token       == other.token
    end
  end
end
