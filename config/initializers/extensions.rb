# frozen_string_literal: true

Dir[Rails.root.join('lib/extensions/**/*.rb')].each { |extension| require extension }
