require 'test_helper'
require 'sqlite3_json_rails4/extensions/active_record/type/json'

class JsonTest < Minitest::Test
  def setup
    @instance = Sqlite3JsonRails4::Extensions::ActiveRecord::Type::Json.new
  end

  def test_type_cast_from_database_passes_hash
    hash = { foo: 'bar' }
    assert_equal hash, @instance.type_cast_from_database(hash)
  end

  def test_type_cast_from_database_decodes_string
    hash = { 'foo' => 'bar' }
    assert_equal hash, @instance.type_cast_from_database('{"foo":"bar"}')
  end

  def test_type_cast_from_database_returns_nil_if_decode_error
    assert_nil @instance.type_cast_from_database('{')
  end

  def test_type_cast_for_database_encodes_hash
    hash = { 'foo' => 'bar' }
    assert_equal '{"foo":"bar"}', @instance.type_cast_for_database(hash)
  end

  def test_type_cast_for_database_encodes_string
    assert_equal '"{\\"foo\\":\\"bar\\"}"', @instance.type_cast_for_database('{"foo":"bar"}')
  end
end
