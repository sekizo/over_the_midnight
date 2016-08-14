# OverTheMidnight

Implements the time expression which strided date.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'over_the_midnight'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install over_the_midnight

## Usage

``` ruby
date = Dte.new(2016, 8, 13)

# version 0.1.x
require "over_the_midnight"
otm = OverTheMidnight.new(date, "25:00")
otm.to_time.strftime("%Y/%m/%d %H:%M")
#=> "2016/08/14 01:00"

otm = OverTheMidnight.new(date, 30.5)
otm.to_time.strftime("%Y/%m/%d %H:%M")
#=> "2016/08/14 06:30"

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sekizo/over_the_midnight.
