# frozen_string_literal: true

module Shipment
  class TrackerService < ApplicationService
    attr_reader :tracking_number, :carrier

    include TrackingInstance

    def initialize(tracking_number: nil, carrier: nil)
      @tracking_number = tracking_number
      @carrier = carrier
    end

    def call
      return false if track_by_carrier.blank?

      :processing
    end

    private

    def track_by_carrier
      tracker = "#{String(carrier).squish_downcase}_tracker"
      return unless respond_to?(tracker, true)

      send(tracker, tracking_number)
    end
  end
end
