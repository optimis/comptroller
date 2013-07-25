require 'spec_helper'

module Comptroller
  describe Practice do
    it 'retrieves all pratices' do
      expect(Practice.all.first).to eql(Practice.new(:export_url => 'https://optimis.duxware.com', :token => '12345', :external_id => 3))
    end

    it 'creates new practices' do
      practice = Practice.create(:external_id => 5, :export_url => 'http://hello.world', :token => '12345')
      expect(practice).to eql(Practice.new(:external_id => 5, :export_url => 'http://hello.world', :token => '12345'))
    end

    it 'retrieves practice by id' do
      practice = Practice.find(1)
      expect(practice).to eql(Practice.new(:external_id => 3, :export_url => 'https://optimis.duxware.com', :token => '12345'))
    end

    it 'updates practices' do
      expect(Practice.save_existing(1, :export_url => 'https://optimis.webpt.com')).to be_true
      expect(Practice.find(1).export_url).to eql('https://optimis.webpt.com')
    end
  end
end
