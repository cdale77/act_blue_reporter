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

        # raise an error if anything is wrong with the response
        check_response(response)

        # return the parsed data as a hash.
        return response.parsed_response
      end

      def request_wrapper(request_uri, authentication)
        Timeout.timeout(5) do
          HTTParty.get("#{ACTBLUE_URI}#{request_uri}",
                                  basic_auth: authentication,
                                  headers: HEADER)
        end
      end

      def check_response(response)
        # response can be nil if the act blue entity id is blank
        unless response
          raise_error("No response. Check the ActBlue entity ID.")
        end

        # raise an error if parsed_response is nil
        unless response.parsed_response
          raise_error("Did not get any data from ActBlue.")
        end

        # raise an error if the success code is false
        unless response.success?
          raise_error("HTTP response code: #{response.response.code}")
        end

        # raise an error if the response is not a hash
        unless response.is_a? Hash
          raise_error("Response is a #{response.class}. Expecting hash")
        end
      end


      def raise_error(message)
        raise ActBlueReporter::Exceptions::ConnectionError.new(msg: message)
      end
  end
end
