require 'her'

her_url = 'http://localhost:3001'

if defined? Rails
  her_url = case Rails.env
  when 'production'
  when 'rc', 'megatron'
    'https://dux-canary-rc.optimispt.com'
  else
    'http://localhost:3001'
  end
end

Her::API.setup url: her_url do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::DefaultParseJSON
  c.use Faraday::Adapter::NetHttp
end
