module Comptroller
  class ClaimError
    include Her::Model
    use_api BILLING_API
    collection_path '/duxware_errors'

    def eql?(other)
      id.eql? other.id
    end 
  end
end
