# frozen_string_literal: true

Dir[Rails.root.join('lib/rest_requests/**/*.rb')].each { |r| require r }
