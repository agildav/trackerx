# frozen_string_literal: true

Dir[Rails.root.join('lib/constants/**/*.rb')].each { |extension| require extension }
