module Comptroller
  module ResetHelper
    def self.reset
      Net::HTTP.get(URI("http://127.0.0.1:#{Comptroller::DEFAULT_PORT}/resets"))
    end
  end
end
