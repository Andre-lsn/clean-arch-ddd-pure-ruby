# frozen_string_literal: true

module Protocols
  module Cache
    class CachePolicy
      MAX_AGE_IN_DAYS = 3

      def self.validate(cache, current_date)
        max_age = cache.timestamp + MAX_AGE_IN_DAYS

        max_age > current_date
      end
    end
  end
end
