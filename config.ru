# frozen_string_literal: true

require_relative './app/app'

use Controllers::PurchasesController

run Sinatra::Application
