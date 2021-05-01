# frozen_string_literal: true

module TrackingInstance
  def fedex_tracker(tracking_number)
    perform_job(tracking_number, FedexTrackerWorker)
  end

  private

  def perform_job(tracking_number, worker_class)
    worker_class.perform_async(tracking_number)
  end
end
