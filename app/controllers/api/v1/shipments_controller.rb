# frozen_string_literal: true

module Api
  module V1
    class ShipmentsController < ApplicationController
      def track
        data = Shipment::TrackerService.call(tracking_number: track_params[:tracking_number], carrier: track_params[:carrier])
        raise BadCarrierError if data.blank?

        render_response(data: data, meta: nil)
      end

      private

      def track_params
        params.permit(%i[tracking_number carrier])
      end
    end
  end
end
