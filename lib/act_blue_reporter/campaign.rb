module ActBlueReporter

  class Campaign
    # This class models a campaign or committee at ActBlue and provides
    # some basic functionality.

    attr_reader :act_blue_entity_id

    def initialize(act_blue_login, act_blue_password, act_blue_entity_id)
      super
      @auth = { username: act_blue_login,
                password: act_blue_password }
      @act_blue_entity_id = act_blue_entity_id
    end

  end
end