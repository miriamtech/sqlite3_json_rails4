require 'test_helper'
require 'sqlite3_json_rails4/extensions/active_record/type/json'
require 'sqlite3_json_rails4/extensions/active_record/connection_adapters/sqlite3_adapter'

class SQLite3AdapterAdditionsTest < Minitest::Test
  class FakeClass
    attr_reader :map

    prepend Sqlite3JsonRails4::Extensions::ActiveRecord::ConnectionAdapters::SQLite3AdapterAdditions

    def initialize_type_map(map)
      @map = map
    end
  end

  def setup
    @instance = FakeClass.new
  end

  def test_json_is_properly_registered
    mock = Minitest::Mock.new
    mock.expect :register_type, nil, [/^json/i, Sqlite3JsonRails4::Extensions::ActiveRecord::Type::Json.new]

    @instance.initialize_type_map(mock)

    mock.verify
  end
end
