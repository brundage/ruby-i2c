[![Code Climate](https://codeclimate.com/github/brundage/ruby-i2c/badges/gpa.svg)](https://codeclimate.com/github/brundage/ruby-i2c)
[![Coverage Status](https://coveralls.io/repos/github/brundage/ruby-i2c/badge.svg?branch=master)](https://coveralls.io/github/brundage/ruby-i2c?branch=master)
[![Build Status](https://travis-ci.org/brundage/ruby-i2c.svg?branch=master)](https://travis-ci.org/brundage/ruby-i2c)
[![security](https://hakiri.io/github/brundage/ruby-i2c/master.svg)](https://hakiri.io/github/brundage/ruby-i2c/master)

# RubyI2c

Yet another Ruby I2C interface

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_i2c'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_i2c

## Usage

This library supports the Silicon Labs si70xx chip (for now, pull requests encouraged)

```
irb(main):001:0> s = RubyI2C::Device::SI70XX.new
=> #<RubyI2C::Device::SI70XX:0x56b9a058 @adapter=#<RubyI2C::Adapter::UnixDevice:0x56ae57d0 @slave_addr=1795, @device_file="/dev/i2c-1", @mutex=#<Thread::Mutex:0x56ad7fb8>>, @address=64>

irb(main):002:0> s.relative_humidity
=> 57
irb(main):003:0> s.temperature
=> 22.176728515624994
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/brundage/ruby-i2c.

