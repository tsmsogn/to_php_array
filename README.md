# ToPhpArray

Dump PHP Array from Ruby's Hash or Array.

[![Build Status](https://travis-ci.org/tsmsogn/to_php_array.svg?branch=master)](https://travis-ci.org/tsmsogn/to_php_array)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'to_php_array'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_php_array

## Usage

### ToPhpArray.dump

```ruby
array = [
  'foo',
  3,
  [4, 5]
]
ToPhpArray.dump(array) #=> array('foo', 3, array(4, 5))

hash = {
  :foo => 1,
  2 => 3,
  'bar' => {
    4 => 5
  }
}
ToPhpArray.dump(hash) #=> array('foo' => 1, 2 => 3, 'bar' => array(4 => 5))
```

### ToPhpArray#to_php_array

```ruby
array = [1, 2]
array.extend(ToPhpArray)
array.to_php_array #=> array(1, 2)

hash = {
  :foo => 1,
  2 => 3,
  'bar' => {
    4 => 5
  }
}
hash.extend(ToPhpArray)
hash.to_php_array #=> array('foo' => 1, 2 => 3, 'bar' => array(4 => 5))
```

### Options

- wrap

```ruby
array = [1, 2]
ToPhpArray.dump(array, { :wrap => true }) #=>
# array(
#     1,
#     2
# )
```

- indent_size

```ruby
array = [1, 2]
ToPhpArray.dump(array, { :wrap => true, :indent_size => 2 }) #=>
# array(
#   1,
#   2
# )
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tsmsogn/to_php_array.

