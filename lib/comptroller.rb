require "comptroller/version"
require 'comptroller/configuration'
require 'initializers/her'
require 'comptroller/railtie' if defined? Rails

module Comptroller
  autoload :Practice, 'comptroller/practice'
  autoload :ClaimError, 'comptroller/claim_error'
end
