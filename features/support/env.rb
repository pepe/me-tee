PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")

require 'capybara/cucumber'
require 'spec/expectations'

##
# You can handle all padrino applications using instead:
#   Padrino.application
Capybara.app = PadMeTee.tap { |app|  }
