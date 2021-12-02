# Get JSON columns in SQLite on Rails 4

The SQLite3 adapter in Rails doesn't include JSON support until Rails 5. If
you're one of the poor saps wanting to use JSON columns but needing to
support Rails 4 in your gems or apps, this gem is for you.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sqlite3_json_rails4'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sqlite3_json_rails4

## Usage

This gem integrates with the Rails loading process by way of a railtie. All you
need to do is make sure it's `require`d, whether that's by adding it to your
Gemfile, or having `require 'sqlite3_json_rails4'` somewhere else.

## Development

To obtain this gem's dependencies, run `bundle install`.

To run static tests, run `bundle exec rake static`.

To run Ruby tests, run `bundle exec rake test`.

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/miriamtech/sqlite3_json_rails4.
