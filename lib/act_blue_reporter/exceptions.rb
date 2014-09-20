module ActBlueReporter
  module Exceptions
    # Custom exceptions
    class ConnectionError < StandardError
      def initialize(msg = "Error while connecting to ActBlue.")
        super
      end
    end
  end
end
