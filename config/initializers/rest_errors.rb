# frozen_string_literal: true

Dir[Rails.root.join('lib/rest_errors/**/*.rb')].each { |e| require e }
