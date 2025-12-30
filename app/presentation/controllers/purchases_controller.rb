# frozen_string_literal: true

require_relative '../../main/factories/usecases/local_load_purchases_factory'
require_relative '../presenters/collection_presenter'
require_relative '../presenters/cache_timestamp_presenter'

require 'sinatra/base'
require 'json'

module Controllers
  class PurchasesController < Sinatra::Base
    get '/purchases' do
      usecase = Factories::UseCases::LocalLoadPurchasesFactory.build
      result = usecase.load_all

      presenter = Presenters::CollectionPresenter.new(
        collection: result,
        presenter: Presenters::CacheTimestampPresenter
      )

      { data: presenter.as_json }.to_json
    end
  end
end
