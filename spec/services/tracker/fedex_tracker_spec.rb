# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tracker::FedexTracker do
  context 'valid parameters' do
    describe 'successful requests', :vcr do
      let(:tracker) { described_class.new(tracking_number: '713062653486', number_of_retries: 1, retries_interval: 1, timeout: 10.seconds) }

      it 'returns status from API' do
        expect(tracker.call).to satisfy { |result| %w[CREATED ON_TRANSIT DELIVERED EXCEPTION].include?(result) }
      end
    end

    describe 'timeout and error requests', :vcr do
      context 'retry policy on errors' do
        let(:tracker) { described_class.new(tracking_number: '713062653486', number_of_retries: 2, retries_interval: 1, timeout: 1.second) }

        before do
          allow(tracker).to receive(:track_package)
            .and_raise(
              'error'
            )
        end

        it 'fails on error' do
          expect(tracker.call).to be_falsy
        end
      end

      context 'retry policy on timeouts' do
        let(:tracker) { described_class.new(tracking_number: '713062653486', number_of_retries: 2, retries_interval: 1, timeout: 1.second) }

        before do
          allow(tracker).to receive(:track_package)
            .and_return(
              sleep(2.seconds)
            )
        end

        it 'fails on timeout' do
          expect(tracker.call).to be_falsy
        end
      end
    end
  end

  context 'invalid parameters' do
    let(:tracker) { described_class.new(tracking_number: 'XXYYZZ') }

    describe 'invalid tracking number', :vcr do
      it 'returns false' do
        expect(tracker.call).to be_falsy
      end
    end

    describe 'invalid credentials', :vcr do
      before do
        allow(tracker).to receive(:fedex)
          .and_return(
            Fedex::Shipment.new(
              key: 'invalid', password: 'invalid', account_number: 'invalid', meter: 'invalid', mode: 'invalid'
            )
          )
      end

      it 'returns false' do
        expect(tracker.call).to be_falsy
      end
    end
  end
end
