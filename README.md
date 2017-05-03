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
              Ruby 1   100.511k i/100ms
              Rust 1    85.084k i/100ms
             Ruby 10    27.821k i/100ms
             Rust 10    35.761k i/100ms
            Ruby 100     3.411k i/100ms
            Rust 100     6.572k i/100ms
           Ruby 1000   364.000  i/100ms
           Rust 1000   742.000  i/100ms
          Ruby 10000    36.000  i/100ms
          Rust 10000    75.000  i/100ms
Calculating -------------------------------------
              Ruby 1      1.309M (± 3.4%) i/s -      6.634M in   5.072877s
              Rust 1      1.114M (± 3.9%) i/s -      5.616M in   5.049851s
             Ruby 10    300.374k (± 4.1%) i/s -      1.502M in   5.010609s
             Rust 10    399.385k (± 3.3%) i/s -      2.003M in   5.019925s
            Ruby 100     34.440k (± 3.4%) i/s -    173.961k in   5.057112s
            Rust 100     67.595k (± 2.9%) i/s -    341.744k in   5.060185s
           Ruby 1000      3.645k (± 3.0%) i/s -     18.564k in   5.097827s
           Rust 1000      7.526k (± 2.6%) i/s -     37.842k in   5.031570s
          Ruby 10000    365.825  (± 2.5%) i/s -      1.836k in   5.021973s
          Rust 10000    760.173  (± 2.6%) i/s -      3.825k in   5.035471s
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jodosha/hanami_utils_escape.

## Copyright

(c) 2017 Luca Guidi - https://lucaguidi.com
