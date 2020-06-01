# Example Code from Enumerables and Streams Chapter

The `Enum` module has many functions for enumerables (e.g. lists, maps, ranges, etc.)
```elixir
iex(3)> Enum.map(1..5, fn x -> x * 10 end)
[10, 20, 30, 40, 50]
iex(5)> Enum.map([:ok, 4, :"try it"], fn x -> IEx.Info.info(x) end)
[
  [{"Data type", "Atom"}, {"Reference modules", "Atom"}],
  [{"Data type", "Integer"}, {"Reference modules", "Integer"}],
  [{"Data type", "Atom"}, {"Reference modules", "Atom"}]
]
iex(6)> Enum.map([:ok, 4, "try it"], fn x -> IEx.Info.info(x) end)
[
  [{"Data type", "Atom"}, {"Reference modules", "Atom"}],
  [{"Data type", "Integer"}, {"Reference modules", "Integer"}],
  [
    {"Data type", "BitString"},
    {"Byte size", 6},
    {"Description",
     "This is a string: a UTF-8 encoded binary. It's printed surrounded by\n\"double quotes\" because all UTF-8 encoded code points in it are printable.\n"},
    {"Raw representation", "<<116, 114, 121, 32, 105, 116>>"},
    {"Reference modules", "String, :binary"}
  ]
]
```
The Enum module allows to piping using the operator |>
```elixir
iex(8)> 1..5 |> Enum.map(&(&1 / 2)) |> Enum.reverse
[2.5, 2.0, 1.5, 1.0, 0.5]
```
Streams are different from Enums since it supports lazy operatations. This is useful when dealing with very large, almost infinity long data
```elixir
iex(12)> long_stream = 1..10000000000000000000000 |> Stream.map(&(&1 * 3)) |> Stream.filter(&(rem(&1, 2) != 0))
#Stream<[
  enum: 1..10000000000000000000000,
  funs: [#Function<48.63880310/1 in Stream.map/2>,
   #Function<40.63880310/1 in Stream.filter/2>]
]>
iex(13)> Enum.take(long_stream, 10)
[3, 9, 15, 21, 27, 33, 39, 45, 51, 57]
```

