# frozen_string_literal: true

Dir[Rails.root.join('lib/tracking_instance/**/*.rb')].each { |e| require e }
