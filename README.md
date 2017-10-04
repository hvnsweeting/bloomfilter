# Bloomfilter

[![CircleCI](https://circleci.com/gh/hvnsweeting/bloomfilter.svg?style=svg)](https://circleci.com/gh/hvnsweeting/bloomfilter)

Pure Elixir implementation of Bloomfilter


## Features

- Easy to read
- Really store data in bits - some other implementations use List to simulate that.
- Use FNVa1_64 hash function

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bloomfilter` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bloomfilter, "~> 0.1.0"}
  ]
end
```


Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bloomfilter](https://hexdocs.pm/bloomfilter).

## TODO
- Calculate number of optimal hash function and bit array size
- Handle other input type than string
