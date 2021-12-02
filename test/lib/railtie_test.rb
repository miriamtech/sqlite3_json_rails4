require 'test_helper'
require 'sqlite3_json_rails4/railtie'

class RailtieTest < Minitest::Test
  def test_no_error_when_running_initializers
    Sqlite3JsonRails4::Railtie.initializers.each(&:run)
  end
end
