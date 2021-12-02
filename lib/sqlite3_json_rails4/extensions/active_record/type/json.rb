# frozen_string_literal: true

# This class is taken from the Rails v5.2.6 tree and rewritten for the Rails 4
# API.
module Sqlite3JsonRails4
  module Extensions
    module ActiveRecord
      module Type
        class Json < ::ActiveRecord::Type::Value
          include ::ActiveRecord::Type::Mutable

          def type
            :json
          end

          def type_cast_from_database(value)
            return value unless value.is_a?(::String)
            begin
              ActiveSupport::JSON.decode(value)
            rescue StandardError
              nil
            end
          end

          def type_cast_for_database(value)
            ActiveSupport::JSON.encode(value) unless value.nil?
          end

          def changed_in_place?(raw_old_value, new_value)
            type_cast_from_database(raw_old_value) != new_value
          end

          def accessor
            ActiveRecord::Store::StringKeyedHashAccessor
          end
        end
      end
    end
  end
end
