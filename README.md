[![Build Status](https://travis-ci.org/msimkins/ip_address_serializer.svg?branch=master)](https://travis-ci.org/msimkins/ip_address_serializer)
[![Dependency Status](https://gemnasium.com/msimkins/ip_address_serializer.svg)](https://gemnasium.com/msimkins/ip_address_serializer)

# IpAddressSerializer

This gem providers a custom Serializer for ActiveRecord to allow the storage and retrieval of an
IPv4 or IPv6 Address in a String Field

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ip_address_serializer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ip_address_serializer

## Usage

Once the Gem has been added to your Gemfile, in any model that is required to hold an IP Address, add the
following line to your model

```ruby
serialize <field name symbol>, IPAddressSerializer
```
## Contributing

1. Fork it ( https://github.com/msimkins/ip_address_serializer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
