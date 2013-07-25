require 'spec_helper'

module Comptroller
  describe Practice do
    it 'retrieves all pratices' do
      expect(Practice.all.first).to eql(Practice.new(:id => 1, :export_url => 'https://optimis.duxware.com', :token => '12345', :external_id => 3))
    end

    it 'creates new practices' do
      practice = Practice.create(:external_id => 5, :export_url => 'http://hello.world', :token => '12345')
      expect(practice).to eql(Practice.new(:id => 1, :external_id => 5, :export_url => 'http://hello.world', :token => '12345'))
    end
  end
end
