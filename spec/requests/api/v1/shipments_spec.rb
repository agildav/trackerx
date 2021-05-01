# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Api::V1::Shipments', type: :request do
  path '/api/v1/shipments/tracking/{tracking_number}' do
    get('Track shipment') do
      tags 'Shipments'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :tracking_number, in: :path, type: :string, example: '713062653486'
      parameter name: :carrier, in: :query, type: :string, required: true, example: 'FEDEX'

      response 200, 'returns tracking in process' do
        let(:tracking_number) { '713062653486' }
        let(:carrier) { 'FEDEX' }

        examples 'application/json' => {
          status: 'ok',
          data: 'processing',
          meta: nil
        }

        run_test! do |response|
          expect(response).to have_http_status(:ok)
          expect(json_response[:data]).to eq('processing')
        end
      end

      response 400, 'returns invalid carrier' do
        let(:tracking_number) { '713062653486' }
        let(:carrier) { nil }

        examples 'application/json' => {
          message: 'Invalid carrier',
          status: 'bad_request',
          type: 'request_error',
          errors: []
        }

        run_test! do |response|
          expect(response).to have_http_status(:bad_request)
        end
      end

      response 400, 'returns invalid carrier' do
        let(:tracking_number) { '713062653486' }
        let(:carrier) { 'TEST' }

        examples 'application/json' => {
          message: 'Invalid carrier',
          status: 'bad_request',
          type: 'request_error',
          errors: []
        }

        run_test! do |response|
          expect(response).to have_http_status(:bad_request)
        end
      end
    end
  end
end
