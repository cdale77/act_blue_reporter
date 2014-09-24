[![Code Climate](https://codeclimate.com/github/cdale77/act_blue_reporter/badges/gpa.svg)](https://codeclimate.com/github/cdale77/act_blue_reporter)
[![Test Coverage](https://codeclimate.com/github/cdale77/act_blue_reporter/badges/coverage.svg)](https://codeclimate.com/github/cdale77/act_blue_reporter)
[![Build Status](https://travis-ci.org/cdale77/act_blue_reporter.svg?branch=master)](https://travis-ci.org/cdale77/act_blue_reporter)

# ActBlueReporter

This is a Ruby gem designed to simplify getting contribution information from
ActBlue. It is designed to work across multiple ActBlue campaigns. 

It is not a full-fledged wrapper for the ActBlue API; it doesn't do much more
than retrieve data. 

Extracted from [DonorStack](http://donorstack.com/).

## Installation

Add this line to your application's Gemfile:

    gem 'act_blue_reporter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install act_blue_reporter

## Usage

Create a campaign object. The login and password are the same as you use for
the web interface. The entity ID can be obtained from the web interface. It is
usually visible in the url. 

    campaign = ActBlueReporter::Campaign.new(act_blue_login, 
                                             act_blue_password, 
                                             act_blue_entity_id)
                                  
You can use the campaign object to get data.
  
    # returns a hash of campaign details. Useful for checking credentials.
    campaign.details
    
    # returns a hash of all the campaign's contributions. Use with care. 
    campaign.all_contributions
    
    # returns the contributions in the last 24 hours
    campaign.contributions_in_last_24_hours
    
    # returns contributions in a certain time range. Arguments must be
    # ISO 8601 formatted strings. 
    campaign.contributions_in_time_range(start_time, end_time)
    
The structure of the response is 
different if there is one contribution, or more than one. In particular, 
responses containing multiple contributions are nested one level more than 
single contributions. This class abstracts that away and returns a predictable 
structure. 

    payload = campaign.all_contributions
    formatter = ActBlueReporter::ContributionReport.new(payload)
    report = formatter.report
    
    # you can also get the count of contributions from the formatter object
    formatter.count
    

## Contributing

1. Fork it ( https://github.com/cdale77/act_blue_reporter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
