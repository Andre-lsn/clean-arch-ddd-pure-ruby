# frozen_string_literal: true

module Presenters
  class CacheTimestampPresenter
    def initialize(cache_timestamp)
      @cache_timestamp = cache_timestamp
    end

    def as_json
      { timestamp: serialize_timestamp }
    end

    private

    attr_reader :cache_timestamp

    def serialize_timestamp
      value = cache_timestamp.respond_to?(:timestamp) ? cache_timestamp.timestamp : cache_timestamp

      if value.is_a?(Date) || value.is_a?(Time)
        value.iso8601
      else
        value
      end
    end
  end
end
