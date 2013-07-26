require "comptroller/version"
require 'initializers/her'

module Comptroller
  DEFAULT_PORT = 11999

  autoload :Practice, 'comptroller/practice'
  autoload :ClaimError, 'comptroller/claim_error'
end
