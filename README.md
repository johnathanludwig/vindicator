# VINdicator

VINdicator is a small gem that will allow you to verify that a VIN is valid based on its check digit.

## Installation

Add this line to your application's Gemfile:

    gem 'vindicator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vindicator

## Usage

Using a VIN, call valid_vin? and it will return true or false.

    $ Vindicator.valid_vin?('5GZCZ43D13S812715') => true
    $ Vindicator.valid_vin?('TGZCZ43D13S812715') => false

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
