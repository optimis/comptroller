require 'spec_helper'

module Comptroller
  describe ClaimError do
    it 'retrieves claim errors' do
      expect(ClaimError.all.first).to eql(ClaimError.new(:id => 1))
    end

    it 'retrieves claim errors by external_id' do
      expect(ClaimError.where(:external_id => 3).size).to eql(1)
      expect(ClaimError.where(:external_id => 3).first).to eql(ClaimError.new(:id => 1))
    end

    it 'allows deleting of claim errors' do
      error = ClaimError.all.first
      ClaimError.destroy_existing(error.id)
      expect(ClaimError.all).to_not include(error)
    end

    it 'allows updating of errors' do
      error = ClaimError.save_existing(1, :message_body => 'foo bar')
      expect(ClaimError.find(1).message_body).to eql('foo bar')
    end

    describe '.count' do
      it 'returns total number of claim errors' do
        expect(ClaimError.count).to eql(2)
      end

      it 'returns total number of claim errors for given external id' do
        expect(ClaimError.count(:external_id => 3)).to eql(1)
      end
    end
  end
end
