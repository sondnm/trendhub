# Trendhub

[![Build Status](https://travis-ci.org/sondnm/trendhub.svg?branch=master)](https://travis-ci.org/sondnm/trendhub)
[![Maintainability](https://api.codeclimate.com/v1/badges/961c76d5f9d2014eedc5/maintainability)](https://codeclimate.com/github/sondnm/trendhub/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/961c76d5f9d2014eedc5/test_coverage)](https://codeclimate.com/github/sondnm/trendhub/test_coverage)

`trendhub` is a CLI gem to fetch github trending repositories.

## Installation

Install this gem yourself as:

```bash
$ gem install trendhub
```

## Usage

### `trendhub repo`
List trending repositories from Github
Supported options:
```
trendhub repo
--for      # Allow listing trending repositories 
             in time range of daily, weekly or monthly.
--language # Allow listing trending repositories 
             in a supported language, unknown ones or all.
```

### `trendhub languages`
List all supported languages in format of slug

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests.
You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`,
which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/trendhub. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Trendhub project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/sondnm/trendhub/blob/master/CODE_OF_CONDUCT.md).
