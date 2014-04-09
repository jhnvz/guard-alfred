## Guard Alfred

[![Gem Version](http://img.shields.io/gem/v/guard-alfred.svg)][gem]
[![Build Status](http://img.shields.io/travis/jhnvz/guard-alfred.svg)][travis]
[![Coverage Status](http://img.shields.io/coveralls/jhnvz/guard-alfred.svg)][coveralls]
[![Code Climate](http://img.shields.io/codeclimate/github/jhnvz/guard-alfred.svg)][codeclimate]
[![Dependency Status](http://img.shields.io/gemnasium/jhnvz/guard-alfred.svg)][gemnasium]

[gem]: https://rubygems.org/gems/guard-alfred
[travis]: http://travis-ci.org/jhnvz/guard-alfred
[coveralls]: https://coveralls.io/r/jhnvz/guard-alfred
[codeclimate]: https://codeclimate.com/github/jhnvz/guard-alfred
[gemnasium]: https://gemnasium.com/jhnvz/guard-alfred

Automatically creates fixture files of your controller action responses under several conditions.

Installation
------------

Add the gem to your Gemfile (inside development group):

``` ruby
 gem 'guard-alfred', :require => false
```

Add guard definition to your Guardfile by running this command:

```
$ guard init alfred
```

Usage
------------

Please read [Guard usage doc](https://github.com/guard/guard#readme).

Guardfile
------------

Make sure to put this block on top of your Guardfile so all fixtures are created before running tests.

```ruby
guard :alfred do
  watch(%r{^app/controllers/(.+)\.rb$}) { |m| "spec/alfreds/#{m[1]}.rb" }
  watch(%r{^spec/alfreds/(.+)\.rb$})    { |m| "spec/alfreds/#{m[1]}.rb" }
end
```

Supported Ruby Versions
------------

This library is tested against Travis and aims to support the following Ruby
implementations:

* Ruby 1.9.3
* Ruby 2.0.0
* Ruby 2.1.1

Contributing
------------

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Copyright
------------

Copyright (c) 2014 Johan van Zonneveld. See LICENSE for details.
