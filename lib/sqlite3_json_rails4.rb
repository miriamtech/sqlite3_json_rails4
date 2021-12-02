require 'sqlite3_json_rails4/version'
require 'sqlite3_json_rails4/railtie'

require 'active_support/core_ext/hash/keys' # Required by ActiveRecord
require 'active_record'

module Sqlite3JsonRails4
  class Error < StandardError; end
  # Your code goes here...
end
