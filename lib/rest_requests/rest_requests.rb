# frozen_string_literal: true

module RestRequests
  def get(url, headers = {})
    RestClient.get(url, headers)
  rescue RestClient::ExceptionWithResponse, RestClient::Exception => e
    e.response
  rescue StandardError => _e
    nil
  end

  def post(url, params = {}, headers = {})
    RestClient.post(url, params, headers)
  rescue RestClient::ExceptionWithResponse, RestClient::Exception => e
    e.response
  rescue StandardError => _e
    nil
  end

  def json_response(response = nil)
    return if response.blank?

    if response.body.blank?
      {}
    else
      parsed = JSON.parse(response.body)

      if parsed.is_a?(Hash)
        parsed.with_indifferent_access
      else
        parsed
      end
    end
  end
end
