# frozen_string_literal: true

module RetriesHandler
  def with_retry(number_of_retries, interval = 10, exceptions = [])
    retries ||= 0

    begin
      yield
    rescue => e
      retries += 1
      raise e if retries >= number_of_retries || exceptions.include?(e.class)

      sleep(interval)
      retry
    end
  end
end
