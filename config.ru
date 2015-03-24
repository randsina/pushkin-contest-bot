$LOAD_PATH.unshift(File.dirname(__FILE__)) # Add current directory to load paths

require 'active_support'
require 'active_support/core_ext/string/access'
require 'active_support/core_ext/string/behavior'
require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext'
require 'active_support/multibyte/chars'
require 'json'
require 'Railz'

run Railz.new
