# frozen_string_literal: true

require_relative '../../../infra/cache/cache_store'
require_relative '../../../data/usecases/load_purchases/local_load_purchases'

module Factories
  module UseCases
    class LocalLoadPurchasesFactory
      def self.build
        cache_store = Cache::CacheStore
        ::UseCases::LoadPurchases::LocalLoadPurchases.new(
          cache_store: cache_store,
          current_date: Date.today
        )
      end
    end
  end
end
