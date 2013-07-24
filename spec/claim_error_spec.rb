require 'spec_helper'

module Comptroller
  describe ClaimError do
    it 'retrieves claim errors' do
      claim_error = ClaimError.new(:id => 1)
      expect(ClaimError.all.first).to eql(claim_error)
    end
  end
end
