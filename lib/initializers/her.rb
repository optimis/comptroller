require 'her'

BILLING_CONFIG = YAML.load_file(Rails.root.join('config/optimis_billing.yml'))[Rails.env]
ENV['DUXTAPE_API_URL'] = BILLING_CONFIG['duxtape_api_url']

her_url = 'http://127.0.0.1:3002'

if defined? Rails
  her_url = case Rails.env
  when 'test','integration'
    "http://127.0.0.1:#{Comptroller::Configuration::PORT}"
  else
    ENV['DUXTAPE_API_URL'] ? ENV['DUXTAPE_API_URL'] : 'http://127.0.0.1:3002'
  end
end

BILLING_API = Her::API.new
BILLING_API.setup url: her_url, ssl: { verify: false } do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::DefaultParseJSON
  c.use Faraday::Adapter::NetHttp
end
