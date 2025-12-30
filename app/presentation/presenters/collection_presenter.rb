# frozen_string_literal: true

module Presenters
  class CollectionPresenter
    def initialize(collection:, presenter:)
      @collection = collection
      @presenter = presenter
    end

    def as_json
      collection.map { |item| presenter.new(item).as_json }
    end

    private

    attr_reader :collection, :presenter
  end
end
