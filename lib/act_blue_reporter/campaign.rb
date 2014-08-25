module ActBlueReporter

  class Campaign < ActBlueReporter::Connect
    # This class models a campaign or committee at ActBlue and provides
    # some basic functionality.

    attr_reader :act_blue_entity_id

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
  end
end
