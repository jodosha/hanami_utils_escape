# HanamiUtilsEscape

Experimental porting on `Hanami::Utils::Escape` (from [`hanami-utils`](http://hanamirb.org) gem) with native extension written with [Rust](https://www.rust-lang.org/) and [Helix](https://usehelix.com/).

This is **NOT production ready**, it's just an hack.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hanami_utils_escape'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hanami_utils_escape

## Usage

```ruby
require 'hanami_utils_escape'

HanamiUtilsEscape.html("input")
```

## Benchmarks

```shell
➜  ruby benchmarks/benchmark.rb
Warming up --------------------------------------
                Ruby   120.000  i/100ms
                Rust   251.000  i/100ms
Calculating -------------------------------------
                Ruby      1.217k (± 1.7%) i/s -      6.120k in   5.030065s
                Rust      2.489k (± 3.7%) i/s -     12.550k in   5.049542s

Comparison:
                Rust:     2489.0 i/s
                Ruby:     1217.1 i/s - 2.05x  slower
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jodosha/hanami_utils_escape.

## Copyright

(c) 2017 Luca Guidi - https://lucaguidi.com
