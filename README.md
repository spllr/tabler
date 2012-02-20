# tabler

Tabler generates csv from an array of hashes.

It will transform hashes with inconsistent keys into consistant csv tables.

## Installation

```bash
gem install tabler
```

## Usage

```ruby

data = [
      { :col1 => "val 1", :col2 => "val 2"}, 
      { :col1 => "row 2 val 1", :col2 => "row 2 val 2"},
      { :col1 => "row 3 val 1", :col3 => "row 3 val 3", :col2 => "row 3 val 2"},
      { :col1 => "row 4 val 1", :col3 => "row 4 val 3" }
    ]

Tabler.generate(data, :col_sep => ";") # => Generate the csv string

```

The generated string from the example will look like:

```
col1;col2;col3
val 1;val 2;
row 2 val 1;row 2 val 2;
row 3 val 1;row 3 val 3;row 3 val 2
row 4 val 1;;row 4 val 3

```

## Copyright

Copyright (c) 2012 Klaas Speller. See LICENSE for details.

