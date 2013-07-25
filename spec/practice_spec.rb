require 'spec_helper'

module Comptroller
  describe Practice do
    it 'retrieves all pratices' do
      expect(Practice.all.first).to eql(Practice.new(:id => 1, :export_url => 'https://optimis.duxware.com', :token => '12345', :external_id => 3))
    end
  end
end
