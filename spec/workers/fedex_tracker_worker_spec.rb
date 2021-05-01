# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FedexTrackerWorker, type: :worker do
  let(:tracking_number) { 123_456_789 }
  let(:arguments) { [tracking_number] }

  it 'queues the worker' do
    expect { described_class.perform_async(arguments) }.to change(described_class.jobs, :size).by(1)
    expect(described_class).to be_processed_in :normal
    expect(described_class).to be_retryable true
    expect(described_class).to have_enqueued_sidekiq_job(arguments)
  end
end
