module Comptroller
  class Railtie < Rails::Railtie
    initializer 'comptroller_railtie.initialization' do
      if Rails.env.test? || Rails.env.integration?
        require 'spec/fake_server' 
      end
    end
  end
end
