# frozen_string_literal: true

module Cache
  class CacheStore
    class << self
      def fetch(key)
        return unless key == 'purchases'

        Date.today
      end
    end
  end
end
