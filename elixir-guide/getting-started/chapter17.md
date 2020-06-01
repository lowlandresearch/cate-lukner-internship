# Example Code from Comprehensions

Example use of pattern matching with a generator. 
```elixir
iex(16)> for {:ok, val} <- [ok: "duplicate me!", error: "don't you dare", ok: "I want to be duplicated"], do: {:ok, v
al}
[ok: "duplicate me!", ok: "I want to be duplicated"]
```
Example comprehension with generator and filter.
```elixir
iex(11)> for n <- 1..100, Integer.is_odd(n), do: n
[1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39, 41,
 43, 45, 47, 49, 51, 53, 55, 57, 59, 61, 63, 65, 67, 69, 71, 73, 75, 77, 79, 81,
 83, 85, 87, 89, 91, 93, 95, 97, 99]
```
Example use of a bitstring generator
```elixir
iex(8)> for <<c <- "This string">>, do: <<c>>
["T", "h", "i", "s", " ", "s", "t", "r", "i", "n", "g"]
iex(9)> import Integer
Integer
iex(10)> for n <- 1..100, is_prime(n), do: n
** (CompileError) iex:10: undefined function is_prime/1
    (stdlib 3.12.1) lists.erl:1354: :lists.mapfoldl/3
    (stdlib 3.12.1) lists.erl:1355: :lists.mapfoldl/3
```
Example use of `into:` with bitstring generator.
```elixir
iex(6)> for <<c <- "This string">>, into: [], do: {<<c>>, <<c>> <> <<0>>}
[
  {"T", <<84, 0>>},
  {"h", <<104, 0>>},
  {"i", <<105, 0>>},
  {"s", <<115, 0>>},
  {" ", <<32, 0>>},
  {"s", <<115, 0>>},
  {"t", <<116, 0>>},
  {"r", <<114, 0>>},
  {"i", <<105, 0>>},
  {"n", <<110, 0>>},
  {"g", <<103, 0>>}
]
```

