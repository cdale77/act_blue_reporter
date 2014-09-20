module ActBlueReporter
  class ContributionReport < ActBlueReporter::Base

    # This class takes a report from the Campaign class and formats
    # it for convenience. In particular the structure of the response
    # from ActBlue is different in the case of one or > 1 contributions.

    attr_reader :payload

    def initialize(payload)
      @payload = payload
    end

    def report
      # The hash from ActBlue is structured differently in the case of
      # 1 or 1+ responses. This code returns a predictable structure
      if count == 0
        []
      elsif count == 1
        [] << @payload["contribution"]
      else
        @payload["contribution"]
      end
    end

    def count
      @payload["count"] || 0
    end
  end
end
