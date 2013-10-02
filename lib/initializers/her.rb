require 'her'

her_url = 'http://127.0.0.1:3001'

if defined? Rails
  her_url = case Rails.env
  when 'production'
    'https://duxware.optimispt.com'
  when 'rc', 'megatron'
    'https://duxware-rc.optimispt.com'
  when 'test','integration'
    "http://127.0.0.1:#{Comptroller::Configuration::PORT}"
  else
    'http://127.0.0.1:3001'
  end
end

BILLING_API = Her::API.new
BILLING_API.setup url: her_url do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::DefaultParseJSON
  c.use Faraday::Adapter::NetHttp
end
