# frozen_string_literal: true

require 'date'
require_relative '../../../domain/value_object/cache_timestamp'
require_relative '../../protocols/cache/cache_policy'

module UseCases
  module LoadPurchases
    class LocalLoadPurchases
      CACHE_KEY = 'purchases'

      def initialize(cache_store:, current_date: Date.today)
        @current_date = current_date
        @cache_store = cache_store
      end

      def load_all
        begin
          return unless cache_present?
          return unless cache_valid?

          [cache_object, cached_value]
        rescue StandardError => e
          puts e
        end
      end

      private

      attr_reader :cache_store, :current_date

      def cached_value
        @cached_value ||= cache_store.fetch(CACHE_KEY)
      end

      def cache_object
        @cache_object ||= ValueObject::CacheTimestamp.new(timestamp: cached_value)
      end

      def cache_present?
        cached_value
      end

      def cache_valid?
        Protocols::Cache::CachePolicy.validate(cache_object, current_date)
      end
    end
  end
end