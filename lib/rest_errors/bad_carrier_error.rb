# frozen_string_literal: true

require_relative 'rest_error'
class BadCarrierError < RestError
  def initialize(errors = [])
    super('Invalid carrier', errors)
  end
end
