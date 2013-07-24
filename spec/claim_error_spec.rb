require 'spec_helper'

module Comptroller
  describe ClaimError do
    it 'retrieves claim errors' do
      expect(ClaimError.all.first).to eql(ClaimError.new(:id => 1))
    end
  end
end
