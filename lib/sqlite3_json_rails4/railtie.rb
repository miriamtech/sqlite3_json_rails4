# frozen_string_literal: true

require 'sqlite3_json_rails4'
require 'rails'

module Sqlite3JsonRails4
  class Railtie < Rails::Railtie
    initializer 'sqlite3_json_rails4.patch_json_types' do
      require 'sqlite3_json_rails4/extensions/active_record/type/json'
      ActiveRecord::Type.include Sqlite3JsonRails4::Extensions::ActiveRecord::Type

      require 'sqlite3_json_rails4/extensions/active_record/connection_adapters/table_definitions'
      ActiveRecord::ConnectionAdapters::TableDefinition.include(
        Sqlite3JsonRails4::Extensions::ActiveRecord::ConnectionAdapters::TableDefinitionAdditions,
      )

      require 'sqlite3_json_rails4/extensions/active_record/connection_adapters/sqlite3_adapter'
      ActiveRecord::ConnectionAdapters::SQLite3Adapter.prepend(
        Sqlite3JsonRails4::Extensions::ActiveRecord::ConnectionAdapters::SQLite3AdapterAdditions,
      )
    end
  end
end
