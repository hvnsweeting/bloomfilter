defmodule Bloomfilter do
  use Bitwise
  @fnv_offset_basis_64_bit 14695981039346656037
  @fnv_prime_64_bit 1099511628211
  @moduledoc """
  Documentation for Bloomfilter.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Bloomfilter.hello
      :world

  """
  def hello do
    :world
  end

  @doc """
  Calculates n to the power of k

  """
  def pow(n, k), do: pow(n, k, 1)
  def pow(_, 0, acc), do: acc
  def pow(n, k, acc), do: pow(n, k - 1, n * acc)

  @doc """
  Calculates 64-bit FNV-1a hash of given data
  https://en.wikipedia.org/wiki/Fowler%E2%80%93Noll%E2%80%93Vo_hash_function

  """
  def fnv1a_64(data) do
    # TODO bitmaching
    # https://hexdocs.pm/elixir/Kernel.SpecialForms.html#%3C%3C%3E%3E/1
    l = :binary.bin_to_list(data)

    Enum.reduce(l, @fnv_offset_basis_64_bit, fn(x, acc) -> (x ^^^ acc) * @fnv_prime_64_bit end) |> rem(pow(2, 64))
  end


  defstruct [:bits]
  @doc """
  Generate i-th hash function for using with Bloom filter
  """
  def hashi(i, size, data) do
    rem(fnv1a_64(<<i>> <> data), size)
  end

  def new(size) do
    %Bloomfilter{bits: Bitmap.new(size)}
  end

  def add(bf, value) do
    Enum.reduce(1..7, bf, (fn (i, acc) -> %Bloomfilter{bits: Bitmap.set(acc.bits, hashi(i, acc.bits.size, value))} end))

  end

  def contains?(bf, value) do
    !Enum.any?(1..7, fn i -> !Bitmap.set?(bf.bits, hashi(i, bf.bits.size, value)) end)
  end

  def optimal_km(n, p) do
    # TODO calculate optimal K, M
    # fix hardcorded number of k
  end
end
