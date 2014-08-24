module ActBlueReporter

  class Campaign < ActBlueReporter::Connect
    # This class models a campaign or committee at ActBlue and provides
    # some basic functionality.

    attr_reader :act_blue_entity_id

    def initialize(act_blue_login, act_blue_password, act_blue_entity_id)
      @auth = { username: act_blue_login,
                password: act_blue_password }
      @act_blue_entity_id = act_blue_entity_id
    end

    def details
      response = make_request("/entities/#{@act_blue_entity_id.to_s}", @auth)

      # if successful, we will have an entity hash, if not return false.
      response["entity"] ? response["entity"] : false
    end

  end
end