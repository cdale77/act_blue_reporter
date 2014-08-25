require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
require "active_support"
require "active_support/core_ext/time/calculations"
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

    # successful entities request
    stub_request(:get,
        "https://secure.actblue.com/api/2009-08/entities/").
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

    # failing entities request
    stub_request(:get,
        "https://secure.actblue.com/api/2009-08/entities/0").
        with(headers: { "Accept" => "application/xml" }).
        to_return(status: 404,
                  body: "",
                  headers: {
                      "Date" => "Sun, 24 Aug 2014 20:02:46 GMT",
                      "Server" => "Apache",
                      "Content-Type" => "application/xml; charset=utf-8",
                      "Status" => "404 Not Found"
                          }
                  )

    # all contributions request
    stub_request(:get,
        "https://secure.actblue.com/api/2009-08/contributions?destination=").
        with(headers: {'Accept'=>'application/xml'}).
        to_return(status: 200,
                  body: "#{SpecData.act_blue_contributions_response_xml}",
                  headers: {
                      "Date" => "Sun, 24 Aug 2014 20:02:46 GMT",
                      "Server" => "Apache",
                      "Content-Type" => "application/xml; charset=utf-8",
                      "Status" => "200 OK"
                          }
                  )

    # contributions in date range request
    stub_request(:get,
        "https://secure.actblue.com/api/2009-08/contributions?destination=&payment_timestamp=2014-08-23T00:00:00-07:00/2014-08-24T00:00:00-07:00").
        with(headers: {'Accept'=>'application/xml'}).
        to_return(status: 200,
                  body: "#{SpecData.act_blue_contributions_response_xml}",
                  headers: {
                      "Date" => "Sun, 24 Aug 2014 20:02:46 GMT",
                      "Server" => "Apache",
                      "Content-Type" => "application/xml; charset=utf-8",
                      "Status" => "200 OK"
                          }
                  )

  end
end