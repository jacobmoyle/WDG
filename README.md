# Train Navigator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'train_navigator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install train_navigator

## Usage

Create a new `Map` with an `Array` of connected `Nodes` and their `Weights`.

```ruby
map = TrainNavigator::Map.new ['AB5', 'BC4', 'CD8', 'DC8', 'DE6', 'AD5', 'CE2', 'EB3', 'AE7']
```

## Development

- Check out the repo
- Run `bin/setup` to install dependencies
- Run `rake spec` to run the tests

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
