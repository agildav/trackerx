# frozen_string_literal: true

Dir[Rails.root.join('lib/retries_handler/**/*.rb')].each { |extension| require extension }
