require "httparty"

module ActBlueReporter

  class Connect < ActBlueReporter::Base

    # This class provides the basic request method used to communicate with
    # ActBlue.

    include HTTParty

    ACTBLUE_URI = "https://secure.actblue.com/api/2009-08"
    HEADER = { "Accept" => "application/xml" }

    private
      def make_request(request_url, authentication)

        # pre-create the response as an empty string
        response = ""

        # attempt to connect to ActBlue
        Timeout.timeout(5) do
          response = HTTParty.get("#{ACTBLUE_URI}#{request_url}",
                                  basic_auth: authentication,
                                  headers: HEADER)
        end

        # Parsed response is nil when an incorrect entity id is used
        response.parsed_response ? response.parsed_response : ""
      end

  end
end