# frozen_string_literal: true

class FedexTrackerWorker
  include Sidekiq::Worker
  include Sidekiq::Throttled::Worker

  sidekiq_options queue: :normal
  sidekiq_throttle_as :delivery_api

  def perform(tracking_number)
    Tracker::FedexTracker.call(tracking_number: tracking_number)
  end
end
