module ActBlueReporter
  module Exceptions
    # Custom exceptions
    class ActBlueConnectionError < StandardError; end
    class ActBlueAccountError < StandardError; end
    class ActBlueReportError < StandardError; end
  end
end
