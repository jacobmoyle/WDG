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

A new `Map` may be created with an `Array` of `Weighted` `Nodes`.

```ruby
map = TrainNavigator::Map.new ['AB5', 'BC4', 'CD8', 'DC8', 'DE6', 'AD5', 'CE2', 'EB3', 'AE7']
```

A new `Route` may be created with an `Array` of `Nodes`:

```ruby
route = TrainNavigator::Route.new ['A', 'D', 'C']
```

### Distance

Returns the total `Weight` of a `Route`:

```ruby
TrainNavigator::Calculate.distance(map, route) #=> 13
```

### Queries

Find all potential Routes:

```ruby
routes = TrainNavigator::Query.where(map, 'C', 'C')
```

_Note: Currently a Route is limited to 8 nodes_

### Additional Filters

Returns `Integers`:

#### Max Stops (AKA Nodes)

```ruby
routes.max_stops 3
```

#### Max Distance

```ruby
routes.max_distance 30
```

#### Exact

```ruby
routes.exactly 4
```

#### Shortest

```ruby
routes.shortest
```

## Development

- Check out the repo
- Run `bin/setup` to install dependencies
- Run `rake spec` to run the tests

You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.
