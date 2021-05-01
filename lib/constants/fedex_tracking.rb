# frozen_string_literal: true

module Constants
  module FedexTracking
    EXCEPTIONS = [
      Fedex::RateError
    ].freeze

    STATUS_CODES = {
      OC: 'CREATED', # Order Created

      AA: 'ON_TRANSIT', # At Airport
      AC: 'ON_TRANSIT', # At Canada Post facility
      AD: 'ON_TRANSIT', # At Delivery
      AF: 'ON_TRANSIT', # At FedEx Facility
      AP: 'ON_TRANSIT', # At Pickup
      AR: 'ON_TRANSIT', # Arrived at
      AX: 'ON_TRANSIT', # At USPS facility
      BR: 'ON_TRANSIT', # Broker
      CC: 'ON_TRANSIT', # Cleared Customs
      CD: 'ON_TRANSIT', # Clearance Delay
      CP: 'ON_TRANSIT', # Clearance in Progress
      CU: 'ON_TRANSIT', # Customs
      DD: 'ON_TRANSIT', # Delivery Delay
      DP: 'ON_TRANSIT', # Departed
      DR: 'ON_TRANSIT', # Vehicle furnished but not used
      DS: 'ON_TRANSIT', # Vehicle Dispatched
      DY: 'ON_TRANSIT', # Delay
      EA: 'ON_TRANSIT', # Enroute to Airport
      ED: 'ON_TRANSIT', # Enroute to Delivery
      EO: 'ON_TRANSIT', # Enroute to Origin Airport
      EP: 'ON_TRANSIT', # Enroute to Pickup
      FD: 'ON_TRANSIT', # At FedEx Destination
      HL: 'ON_TRANSIT', # Hold at Location
      IT: 'ON_TRANSIT', # In Transit
      IX: 'ON_TRANSIT', # In transit (see Details)
      LO: 'ON_TRANSIT', # Left Origin
      LP: 'ON_TRANSIT', # Return label link cancelled by shipment originator
      OD: 'ON_TRANSIT', # Out for Delivery
      OF: 'ON_TRANSIT', # At FedEx origin facility
      OX: 'ON_TRANSIT', # Shipment information sent to USPS
      PD: 'ON_TRANSIT', # Pickup Delay
      PF: 'ON_TRANSIT', # Plane in Flight
      PL: 'ON_TRANSIT', # Plane Landed
      PM: 'ON_TRANSIT', # In Progress
      PU: 'ON_TRANSIT', # Picked Up
      PX: 'ON_TRANSIT', # Picked up (see Details)
      RD: 'ON_TRANSIT', # Return label link expired
      RG: 'ON_TRANSIT', # Return label link expiring soon
      RM: 'ON_TRANSIT', # CDO Modified
      RP: 'ON_TRANSIT', # Return label link emailed to return sender
      RR: 'ON_TRANSIT', # CDO requested
      RS: 'ON_TRANSIT', # Return to Shipper
      SF: 'ON_TRANSIT', # At Sort Facility
      SH: 'ON_TRANSIT', # Shipper
      SP: 'ON_TRANSIT', # Split Status
      TP: 'ON_TRANSIT', # Transfer Partner
      TR: 'ON_TRANSIT', # Transfer

      DL: 'DELIVERED', # Delivered

      CA: 'EXCEPTION', # Shipment Cancelled
      CH: 'EXCEPTION', # Location Changed
      DE: 'EXCEPTION', # Delivery Exception
      RC: 'EXCEPTION', # CDO Cancelled
      SE: 'EXCEPTION' # Shipment Exception
    }.freeze
  end
end
