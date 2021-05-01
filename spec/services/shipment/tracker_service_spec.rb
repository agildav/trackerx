# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shipment::TrackerService do
  context 'valid parameters' do
    let(:tracking_number) { '713062653486' }
    let(:carrier) { 'FEDEX' }

    it 'returns false' do
      expect(described_class.call(tracking_number: tracking_number, carrier: carrier)).to eq(:processing)
    end
  end

  context 'invalid parameters' do
    describe 'missing carrier' do
      let(:tracking_number) { '713062653486' }
      let(:carrier) { 'TEST' }

      it 'returns false' do
        expect(described_class.call(tracking_number: tracking_number, carrier: carrier)).to be_falsy
      end
    end

    describe 'missing tracking number' do
      let(:tracking_number) { nil }
      let(:carrier) { 'TEST' }

      it 'returns false' do
        expect(described_class.call(tracking_number: tracking_number, carrier: carrier)).to be_falsy
      end
    end
  end
end
