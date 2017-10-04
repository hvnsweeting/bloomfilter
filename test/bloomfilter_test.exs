defmodule BloomfilterTest do
  use ExUnit.Case
  doctest Bloomfilter

  test "greets the world" do
    assert Bloomfilter.hello() == :world
  end

  test "FNV1a hash of 123456" do
    assert Bloomfilter.fnv1a_64("123456") == 17790324078706895114
  end

  test "Init bloomfilter with 1mil bits" do
    assert Bloomfilter.new(1000000).bits.size == 1000000
  end

# THIS TAKE > 50s, improve it?
#  test "Add string Elixir to filter, see K bit changed" do
#    k = 7 #TODO fix hardcode
#    bf = Bloomfilter.new(1000000)
#    bf = Bloomfilter.add(bf, "Elixir")
#    assert Bitmap.to_string(bf.bits) |> String.to_charlist |> Enum.count(fn x -> x == 49 end) == k
#  end

  test "False Negative always == 0" do
    bf = Bloomfilter.new(1000000)
    bf = Bloomfilter.add(bf, "Elixir")
    assert Bloomfilter.contains?(bf, "Python") == false
    assert Bloomfilter.contains?(bf, "Elixi") == false

    assert Bloomfilter.contains?(bf, "Elixir") == true
  end
# TODO Add test for True Negative
end
