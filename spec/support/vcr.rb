# frozen_string_literal: true

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.configure_rspec_metadata!

  %w[
    FEDEX_KEY
    FEDEX_PASSWORD
    FEDEX_ACCOUNT_NUMBER
    FEDEX_METER
    FEDEX_MODE
  ].each do |key|
    c.filter_sensitive_data("<#{key}>") { ENV[key] }
  end
end
