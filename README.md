# Google S2 Geometry Gem

JRuby Gem wrapper for Google's S2 Geometry Java Library. S2 is a spherical geometry library from Google, available in Java, C++ and partially in Golang.

Google Maps uses S2 to index the Earth, making any part of it addressable at resolutions varying from centimetres to kilometres.

This codebase is forked from https://github.com/google/s2-geometry-library-java 

Please read up on the usage of `import` in JRuby - I'd recommend you always `import` inside a Module so you don't pollute the global namepsace with Java classes.

## Usage

Via RubyGems

```
$ gem install s2geometry-jar
```

Via Bundler

```
gem 's2geometry-jar', require: 'S2Geometry'
```

#### Convert Lat/Long to S2Id, S2Id level operation

```
require "S2Geometry"

module Demo
  import 'com.google.common.geometry'
  
  s2_lat_long = S2LatLng.from_degrees(-6.2, 106.816667)
  s2_id_level_30_1_cm = S2CellId.from_lat_lng(s2_lat_long)
  s2_id_level_21_4_m = s2_id_level_30_1_cm.parent(21)

  puts s2_id_level_30_1_cm, s2_id_level_21_4_m
end
```

#### Calculate distance in metres between Lat/Longs

```
require "S2Geometry"

module Demo
  import 'com.google.common.geometry'
  
  s2_lat_long_1 = S2LatLng.from_degrees(-6.2, 106.816667)
  s2_lat_long_2 = S2LatLng.from_degrees(-6.1, 106.816667)

  puts s2_lat_long_2.getEarthDistance(s2_lat_long_1)
end
```

#### Print Area of a S2 Cell

```
require "S2Geometry"

module Demo
  import 'com.google.common.geometry'

  leaf_cell = S2Cell.build_from_lat_long(-6.2, 106.816667)
  level_10_parent = leaf_cell.parent(10)
  puts "#{Math.sqrt(level_10_parent.average_area * 6371000 ** 2)} sq m"
end
```

#### Print Areas of Blocks of all S2 Levels in metres s

```
require "S2Geometry"

module Demo
  import 'com.google.common.geometry'

  for i in 1..30
    puts "#{i}, #{Math.sqrt(S2Cell.from_face_pos_level(1, 1, i).average_area * 6371000 ** 2)}"
  end
end
```

# Output

1, 4610063.592790723
2, 2305031.7963953614
3, 1152515.8981976807
4, 576257.9490988404
5, 288128.9745494202
6, 144064.4872747101
7, 72032.24363735504
8, 36016.12181867752
9, 18008.06090933876
10, 9004.03045466938
11, 4502.01522733469
12, 2251.007613667345
13, 1125.5038068336726
14, 562.7519034168363
15, 281.37595170841814
16, 140.68797585420907
17, 70.34398792710454
18, 35.17199396355227
19, 17.585996981776134
20, 8.792998490888067
21, 4.3964992454440335
22, 2.1982496227220167
23, 1.0991248113610084
24, 0.5495624056805042
25, 0.2747812028402521
26, 0.13739060142012605
27, 0.06869530071006302
28, 0.03434765035503151
29, 0.017173825177515756
30, 0.008586912588757878
```

## Development

The original Java repo is untouched, with a `rb/` dir being added containing the JRuby wrapper code, and this `README`.

To run a build:

* navigate to `rb/`
* `.ruby-version` in `rb/` should auto select the appropriate JRuby (requires `rbenv` or `rvm`)
* `bundle install`
* `bundle exec rake -T` will list available tasks
* `bundle exec rake validate --trace` will 
	* clean and rebuild the java jar (needs `ant` and the Java SDK)
	* then copy it over into `rb/` directory
	* build and install the gem
	* `require 'S2Geometry'` and run convert a lat/lng to S2Id to confirm a successful build