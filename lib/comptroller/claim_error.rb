module Comptroller
  class ClaimError
    include Her::Model
    collection_path '/duxware_errors'

    def eql?(other)
      id.eql? other.id
    end 
  end
end
