# twitter-strem-patch

This gem is patch for [twitter](https://github.com/sferik/twitter). Patch for when the stream is disconnected.  When the stream disconnected, raise `Twitter::Error::StreamDisconnect`.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'twitter-stream-patch'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install twitter-stream-patch

## Usage

Just add the following code
```ruby
require 'twitter-stream-patch'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/flum1025/twitter-stream-patch. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Twitter::Stream::Patch project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/twitter-stream-patch/blob/master/CODE_OF_CONDUCT.md).

