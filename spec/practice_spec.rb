require 'support/mimic'
require 'comptroller'

Her::API.setup url: 'http://localhost:11988' do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::DefaultParseJSON
  c.use Faraday::Adapter::NetHttp
end

module Comptroller
  describe Practice do
    it 'should retrieve all pratices' do
      expect(Practice.all.first).to eql(Practice.new(:id => 1))
    end
  end
end
