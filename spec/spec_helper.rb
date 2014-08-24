require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require "pry"
require "act_blue_reporter"
require "webmock/rspec"
WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  #include the custom data file
  config.include SpecData

  # stub out HTTP requests
  config.before(:each) do
    stub_request(:get, "https://secure.actblue.com/api/2009-08/entities/").
        with(headers: { "Accept" => "application/xml" }).
        to_return(status: 200, body: "", headers: {})
  end
end