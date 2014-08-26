require "active_support/core_ext/time/calculations"
require "active_support/core_ext/integer/time"

module ActBlueReporter

  class Campaign < ActBlueReporter::Connect
    # This class models a campaign or committee at ActBlue and provides
    # some basic functionality. ActBlue calls these "entities".

    def initialize(act_blue_login, act_blue_password, act_blue_entity_id)
      @auth = { username: act_blue_login, password: act_blue_password }
      @act_blue_entity_id = act_blue_entity_id
    end

    def details
      request_uri = "/entities/#{@act_blue_entity_id}"
      response = make_request(request_uri, @auth)
      payload = response["entity"]
      raise ActBlueReporter::Exceptions::PayloadError unless payload
      return payload
    end

    def all_contributions
      request_uri = "/contributions?destination=#{@act_blue_entity_id}"
      response = make_request(request_uri, @auth)
      payload = response["contributions"]
      raise ActBlueReporter::Exceptions::PayloadError unless payload
      return payload
    end

    def contributions_in_time_range(start_time, end_time)
      response = make_request( "/contributions?destination=#{@entity.to_s}&" \
                              "payment_timestamp=#{start_time.to_s}/" \
                              "#{end_time.to_s}",
                               @auth)
      payload = response["contributions"]
      raise ActBlueReporter::Exceptions::PayloadError unless payload
      return payload
    end

    def contributions_in_last_24_hrs
      start_time = (Time.now.at_beginning_of_day - 24.hours).iso8601
      end_time = Time.now.at_beginning_of_day.iso8601
      contributions_in_time_range(start_time, end_time)
    end
  end
end
