require 'sqlite3_json_rails4/extensions/active_record/type/json'

module Sqlite3JsonRails4
  module Extensions
    module ActiveRecord
      module ConnectionAdapters
        module TableDefinitionAdditions
          def json(*args)
            options = args.extract_options!
            column_names = args
            column_names.each do |name|
              column(name, :json, options)
            end
          end
        end
      end
    end
  end
end
