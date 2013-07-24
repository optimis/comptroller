require 'comptroller'

module Comptroller
  describe Practice do
    it 'should retrieve all pratices' do
      expect(Practice.all.first).to eql(Practice.new(:id => 1))
    end
  end
end
