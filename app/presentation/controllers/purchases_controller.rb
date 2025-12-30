require_relative '../../main/factories/usecases/local_load_purchases_factory'

module Controllers
  class PurchasesController
    def show
      usecase = Factories::UseCases::LocalLoadPurchasesFactory.build
      result = usecase.load_all

      {
        data: result,
        status: 200
      }
    end

    private

    def cache_store
      @cache_store ||= Cache::CacheStore
    end
  end
end

result = Controllers::PurchasesController.new.show

pp result