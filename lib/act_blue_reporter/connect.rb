module ActBlueReporter
  # This class provides the basic request method used to communicate with
  # ActBlue.
  class Connect < ActBlueReporter::Base
    #include HTTParty

    ACTBLUE_URI = "https://secure.actblue.com/api/2009-08"
    HEADER = { "Accept" => "application/xml" }
  end
end