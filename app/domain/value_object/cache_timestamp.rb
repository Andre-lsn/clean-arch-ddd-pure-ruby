# frozen_string_literal: true

require 'date'

module ValueObject
  class CacheTimestamp < Data.define(:timestamp)
    def initialize(timestamp)
      validate!(timestamp)
      super(timestamp)
    end

    private

    def validate!(date)
      raise ArgumentError, 'CacheTimestamp cannot be in the future' if date[:timestamp] > Date.today
    end
  end
end