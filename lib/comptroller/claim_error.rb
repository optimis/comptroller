module Comptroller
  class ClaimError
    include Her::Model
    use_api BILLING_API
    collection_path '/duxware_errors'
    include_root_in_json true

    attributes :error_message, :created_at, :external_id

    def eql?(other)
      id.eql? other.id
    end 
  end
end
