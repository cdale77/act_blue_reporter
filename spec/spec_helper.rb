require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require "pry"
require "act_blue_reporter"
require "spec_data"
require "webmock/rspec"
WebMock.disable_net_connect!(allow_localhost: true, allow: "codeclimate.com")

RSpec.configure do |config|
  #include the custom data file
  config.include SpecData

  # stub out HTTP requests
  config.before(:each) do
    stub_request(:get, "https://secure.actblue.com/api/2009-08/entities/").
        with(headers: { "Accept" => "application/xml" }).
        to_return(status: 200,
                  body: "#{SpecData.act_blue_entity_response_xml}",
                  headers: {
                      "Date" => "Sun, 24 Aug 2014 20:02:46 GMT",
                      "Server" => "Apache",
                      "Content-Type" => "application/xml; charset=utf-8",
                      "Status" => "200 OK"
                          }
                  )

  end
end