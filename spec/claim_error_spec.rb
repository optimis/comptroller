require 'spec_helper'

module Comptroller
  describe ClaimError do
    it 'retrieves claim errors' do
      expect(ClaimError.all.first).to eql(ClaimError.new(:id => 1))
    end

    it 'allows deleting of claim errors' do
      error = ClaimError.all.first
      ClaimError.destroy_existing(error.id)
      expect(ClaimError.all).to be_empty
    end

    it 'allows updating of errors' do
      error = ClaimError.save_existing(1, :message_body => 'foo bar')
      expect(ClaimError.find(1).message_body).to eql('foo bar')
    end

    it 'defines count' do
      expect(ClaimError.count).to eql(1)
    end
  end
end
