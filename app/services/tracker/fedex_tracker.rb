# frozen_string_literal: true

module Tracker
  class FedexTracker < ApplicationTracker
    include ::Constants::FedexTracking

    def call
      with_retry(number_of_retries, retries_interval, EXCEPTIONS) do
        Timeout.timeout(timeout) do
          tracking_info = track_package
          status = STATUS_CODES[tracking_info.status_code.to_sym].presence || 'EXCEPTION'

          Sidekiq.logger.info(status) unless Rails.env.test? # just for challenge visualization purpose
          status
        end
      end
    rescue => e
      Sidekiq.logger.error(e.message) unless Rails.env.test?
      false
    end

    private

    def track_package
      fedex.track(tracking_number: tracking_number).first
    end

    def fedex
      return @fedex if defined? @fedex

      @fedex = Fedex::Shipment.new(
        key: ENV['FEDEX_KEY'], password: ENV['FEDEX_PASSWORD'], account_number: ENV['FEDEX_ACCOUNT_NUMBER'], meter: ENV['FEDEX_METER'], mode: ENV['FEDEX_MODE']
      )
    end
  end
end
