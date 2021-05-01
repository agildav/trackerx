# frozen_string_literal: true

module Tracker
  class ApplicationTracker < ApplicationService
    attr_reader :tracking_number, :number_of_retries, :retries_interval, :timeout

    include RetriesHandler

    def initialize(tracking_number: nil, number_of_retries: 5, retries_interval: 5, timeout: 1.minute)
      @tracking_number = tracking_number
      @number_of_retries = number_of_retries
      @retries_interval = retries_interval
      @timeout = timeout
    end
  end
end
