# frozen_string_literal: true

require 'sidekiq/throttled'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1') }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1') }
end

Sidekiq::Throttled::Registry.add(
  :delivery_api,
  # Allow maximum 10 concurrent jobs of this class at a time.
  concurrency: { limit: 20 },
  # Allow maximum 1 job being processed within one second window.
  threshold: { limit: 10, period: 1.second }
)

Sidekiq::Throttled.setup!
