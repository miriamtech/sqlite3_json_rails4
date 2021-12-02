require 'test_helper'
require 'sqlite3_json_rails4/extensions/active_record/type/json'
require 'sqlite3_json_rails4/extensions/active_record/connection_adapters/table_definitions'

class TableDefinitionAdditionsTest < Minitest::Test
  class FakeColumn
    attr_accessor :name, :type, :options

    def initialize(name, type, options)
      @name = name
      @type = type
      @options = options
    end
  end

  class FakeClass
    include Sqlite3JsonRails4::Extensions::ActiveRecord::ConnectionAdapters::TableDefinitionAdditions

    attr_reader :columns

    def initialize
      @columns = []
    end

    def column(name, type, options)
      column = FakeColumn.new(name, type, options)
      columns << column
      column
    end
  end

  def setup
    @instance = FakeClass.new
  end

  def test_json_cast_type_is_properly_set
    @instance.json 'test_column'
    assert_equal 1, @instance.columns.length

    column = @instance.columns.first
    assert_equal 'test_column', column.name
    assert_equal :json, column.type
    assert_empty column.options
  end
end
