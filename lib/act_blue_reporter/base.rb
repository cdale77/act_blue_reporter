module ActBlueReporter
  # This is the base class for all ActBlue classes. The purpose of this library
  # is to provide a simple Ruby interface for retrieving contribution
  # information from ActBlue via API. https://secure.actblue.com/api
  class Base
    include ActBlueReporter::Exceptions
  end
end