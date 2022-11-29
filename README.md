# ronin-fuzzer

[![CI](https://github.com/ronin-rb/ronin-fuzzer/actions/workflows/ruby.yml/badge.svg)](https://github.com/ronin-rb/ronin-fuzzer/actions/workflows/ruby.yml)
[![Code Climate](https://codeclimate.com/github/ronin-rb/ronin-fuzzer.svg)](https://codeclimate.com/github/ronin-rb/ronin-fuzzer)

* [Website](https://ronin-rb.dev/)
* [Source](https://github.com/ronin-rb/ronin-fuzzer)
* [Issues](https://github.com/ronin-rb/ronin-fuzzer/issues)
* [Documentation](https://ronin-rb.dev/docs/ronin-fuzzer/frames)
* [Discord](https://discord.gg/6WAb3PsVX9) |
  [Twitter](https://twitter.com/ronin_rb)

## Description

ronin-fuzzer is a Ruby library for generating, mutating, and fuzzing data.

## Features

* Provides a Fuzzer class for incremental substitution fuzzing of data.
* Provides a Mutator class for combinatorial substitution mutation of data.
* Provides methods for enumerating over common "bad strings".
* Provides core extension methods to Ruby's String class.

## Synopsis

Fuzzes an input file and generates output bad files for testing:

```shell
$ ronin-fuzzer fuzz -i http_request.txt -o bad.txt -r unix_path:bad_strings
```

## Requirements

* [Ruby] >= 3.0.0
* [combinatorics] ~> 0.4
* [ronin-support] ~> 1.0
* [ronin-core] ~> 0.1

## Install

```shell
$ gem install ronin-fuzzer
```

### Gemfile

```ruby
gem 'ronin-fuzzer', '~> 0.1'
```

### gemspec

```ruby
gem.add_dependency 'ronin-fuzzer', '~> 0.1'
```

## Development

1. [Fork It!](https://github.com/ronin-rb/ronin-fuzzer/fork)
2. Clone It!
3. `cd ronin-fuzzer/`
4. `bundle install`
5. `git checkout -b my_feature`
6. Code It!
7. `bundle exec rake spec`
8. `git push origin my_feature`

## License

Copyright (c) 2006-2022 Hal Brodigan (postmodern.mod3@gmail.com)

This file is part of ronin-fuzzer.

ronin-fuzzer is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published
by the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

ronin-fuzzer is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with ronin-fuzzer.  If not, see <https://www.gnu.org/licenses/>.

[Ruby]: https://www.ruby-lang.org
[combinatorics]: https://github.com/postmodern/combinatorics#readme
[ronin-support]: https://github.com/ronin-rb/ronin-support#readme
[ronin-core]: https://github.com/ronin-rb/ronin-core#readme
