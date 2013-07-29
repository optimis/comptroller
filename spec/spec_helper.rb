require 'support/reset_helper'
require 'comptroller'
require 'spec/fake_server'

her_url = ENV['API_URL'] || "http://127.0.0.1:#{Comptroller::Configuration::PORT}"
 

BILLING_API = Her::API.new
BILLING_API.setup url: her_url do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::DefaultParseJSON
  c.use Faraday::Adapter::NetHttp
end

Rspec.configure do |config|
  config.after do
    Comptroller::ResetHelper.reset
  end
end
