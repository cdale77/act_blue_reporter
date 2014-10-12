require "active_support/core_ext/time/calculations"
require "active_support/core_ext/integer/time"

module ActBlueReporter

  class Campaign < ActBlueReporter::Connect
    # This class models a campaign or committee at ActBlue and provides
    # some basic functionality. ActBlue calls these "entities".

    def initialize(act_blue_login:, act_blue_password:, act_blue_entity_id: )
      @auth = { username: act_blue_login, password: act_blue_password }
      @act_blue_entity_id = act_blue_entity_id
    end

    def details
      request_uri = "/entities/#{@act_blue_entity_id}"
      response = make_request(request_uri: request_uri, authentication: @auth)
      response["entity"]
    end

    def all_contributions
      request_uri = "/contributions?destination=#{@act_blue_entity_id}"
      response = make_request(request_uri: request_uri, authentication: @auth)
      response["contributions"]
    end

    # Defaults to the last 24 hours if no arguments are supplied
    def contributions_in_time_range(start_time: (Time.now.at_beginning_of_day - 24.hours).iso8601, 
                                    end_time: Time.now.at_beginning_of_day.iso8601)
      request_uri = "/contributions?destination=#{@entity.to_s}&" +
                    "payment_timestamp=#{start_time.to_s}/" +
                    "#{end_time.to_s}"
      response = make_request(request_uri: request_uri, authentication: @auth)
      response["contributions"]
    end

    # Mostly for syntax and clarity
    def contributions_in_last_24_hrs
      contributions_in_time_range()
    end
  end
end
