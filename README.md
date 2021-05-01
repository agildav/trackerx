# Trackerx API

[![CircleCI](https://circleci.com/gh/agildav/trackerx-api.svg?style=svg&circle-token=3f2fd4b813dbd0afa1d1189e69b9ee3175cc58d3)](https://app.circleci.com/pipelines/github/agildav/trackerx-api)

Trackerx package tracking API.

## Installation

1. Clone repository.
2. Have PostreSQL, Redis and Ruby 2.7.2 installed.
3. Run:

    ```bash
    bundle install
    ```
4. Create a `.env` file at the root of the project with the specified values in `.env.example`.
5. Run tests with:
    ```bash
    rspec
    ```
6. You can start the API with 2 terminals:
    ```bash
    # terminal 1
    rails s
    # terminal 2
    sidekiq
    ```
7. You can access the Swagger docs on [/api-docs](http://localhost:3000/api-docs)

## Configuration for new trackers

In the event you want to add new trackers, follow these steps:

We will be using as a example **UPS**.

1. Add a new instance method named `ups_tracker` in `lib/tracking_instance/tracking_instance.rb`
    ```ruby
    # lib/tracking_instance/tracking_instance.rb

    # ...
    def ups_tracker(tracking_number)
      perform_job(tracking_number, UpsTrackerWorker)
    end
    ```

2. Create a new worker class `UpsTrackerWorker` in `app/workers`
    ```ruby
    # app/workers/ups_tracker_worker.rb
    # frozen_string_literal: true

    class UpsTrackerWorker
      include Sidekiq::Worker
      include Sidekiq::Throttled::Worker

      sidekiq_options queue: :normal
      sidekiq_throttle_as :delivery_api

      def perform(tracking_number)
        Tracker::UpsTracker.call(tracking_number: tracking_number)
      end
    end
    ```

3. Create a new tracker class `Tracker::UpsTracker` in `app/services/tracker`
    ```ruby
    # app/services/tracker/ups_tracker.rb
    # frozen_string_literal: true

    module Tracker
      class UpsTracker < ApplicationTracker
        include ::Constants::UpsTracking

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
          # this method will return the UPS tracking_info for the specified tracking_number
        end

        def ups
          return @ups if defined? @ups

          @ups = nil # UPS service initialization
        end
      end
    end
    ```

4. Create a file of the UPS constants needed to return the correct statuses and exceptions to raise named `Constants::UpsTracking` in `lib/constants`
    ```ruby
    # lib/constants/ups_tracking.rb
    # frozen_string_literal: true

    module Constants
      module UpsTracking
        EXCEPTIONS = [
          # list of exceptions for this tracker to be catched and raised when they happen
        ].freeze

        STATUS_CODES = {
          # list of status codes for this tracker and their correspondant application status
          # ...
          OC: 'CREATED', # Order Created
          IT: 'ON_TRANSIT', # In Transit
          DL: 'DELIVERED', # Delivered
          SE: 'EXCEPTION' # Shipment Exception
          # ...
        }.freeze
      end
    end
    ```
