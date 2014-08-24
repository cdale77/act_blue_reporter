require "httparty"

module ActBlueReporter

  class Connect < ActBlueReporter::Base

    # This class provides the basic request method used to communicate with
    # ActBlue.

    include HTTParty

    ACTBLUE_URI = "https://secure.actblue.com/api/2009-08"
    HEADER = { "Accept" => "application/xml" }

    private
      def make_request(request_uri, authentication)

        response = request_wrapper(request_uri, authentication)

        # response can be nil if the act blue entity id is blank
        raise_error("No response. Check the ActBlue entity ID.") unless response

        # if the response is successful then return the parsed data as a hash.
        if response.success?
          return response.parsed_response
        else
          raise_error("HTTP response code: #{response.response.code}")
        end
      end

      def request_wrapper(request_uri, authentication)
        Timeout.timeout(5) do
          HTTParty.get("#{ACTBLUE_URI}#{request_uri}",
                                  basic_auth: authentication,
                                  headers: HEADER)
        end
      end

      def raise_error(message)
        raise ActBlueReporter::Exceptions::ConnectionError.new(msg: message)
      end
  end
end
