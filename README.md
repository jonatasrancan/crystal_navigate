# crystal_navigate

A simple port of https://github.com/jonatasrancan/navigate to Crystal language

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  crystal_navigate:
    github: jonatasrancan/crystal_navigate
```

## Usage

```crystal
require "crystal_navigate"
```

### Distance between 2 positions
```crystal
# the firs param is the latitude, second is the longitude
position1 = position(80.0, 120.0)
position2 = position(90.0, 45.0)

distance(position1, position2)
=> 1111.9508372419155
```
By default the function will return the distane in kilometers

It has a third optional param, to define the unit of the return

```crystal
distance(position1, position2, EarthRadius::NM)
=> 600.4054799908141
```
Available units
```crystal
module EarthRadius
  KM =     6_371.009
  MI =     3_958.761
  NM =     3_440.070
  YD =  6_967_420.00
  FT = 20_902_260.00
end
```

### Bearing between two positions
```crystal
position1 = position(-90.0, 180.0)
position2 = position(90.0, 45.0)

bearing(position1, position2)
=> 292.5
```

### Return a new position based on an initial position, bearing and distance
```crystal
position1 = position(-90.0, 180.0)

destination(position1, 90.0, 100.00)
=> #<CrystalNavigate::Position:0xa44fa0 @latitude=-62.96579828082695, @longitude=-128.5287628698549>
```

By default the function will use kilometer as the default value as distance unit

It has a fourth optional param, to define the unit of the ditance

```crystal
destination(position1, 90.0, 100.00, EarthRadius::NM)
=> #<CrystalNavigate::Position:0x2305f60 @latitude=-62.596039650729324, @longitude=-129.99604694903127>
```

## Contributing

1. Fork it ( https://github.com/jonatasrancan/crystal_navigate/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Make sure you changes are ok `crystal spec`
5. Push to the branch (git push origin my-new-feature)
6. Create a new Pull Request

## Contributors

- [jonatasrancan](https://github.com/jonatasrancan) Jônatas Rancan - creator, maintainer
