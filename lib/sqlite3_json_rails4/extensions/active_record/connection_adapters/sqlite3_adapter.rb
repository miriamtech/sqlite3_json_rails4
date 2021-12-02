require 'active_record/connection_adapters/sqlite3_adapter'
require 'sqlite3_json_rails4/extensions/active_record/type/json'

module Sqlite3JsonRails4
  module Extensions
    module ActiveRecord
      module ConnectionAdapters
        module SQLite3AdapterAdditions
          def initialize_type_map(map)
            super(map)
            map.register_type(/^json/i, Sqlite3JsonRails4::Extensions::ActiveRecord::Type::Json.new)
          end
        end
      end
    end
  end
end
