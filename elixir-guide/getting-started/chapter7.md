# Example Code from Keyword and Map Chapter

Keyword lists are one of the two main associate data structures in Elixir. They use [key: value] syntax. They can also be defined using a list of typles
```elixir
iex(2)> list = [{:one, 1}, {:two, 2}]
[one: 1, two: 2]
iex(3)> list == [one: 1, two: 2]
true
```
You can add to a list with ++
```elixir
iex(5)> list ++ [three: 3]
[one: 1, two: 2, three: 3]
iex(6)> [zero: 0] ++ list
[zero: 0, one: 1, two: 2]
```
The following syntax is valid for a if statement since it creates a keyword list with do: and else:
```
iex(8)> if false, do: "This won't work", else: "This will work"
"This will work"
```
Keyword lists are lists, so they are inefficient in finding a key, counting, etc. They are often used more for passing optional values. The go-to associative data structure for storing many items is maps for key-value data. Maps are created using %{}
```elixir
iex(10)> map = %{:one => 1, 2 => :two}
%{2 => :two, :one => 1}
iex(11)> map[:one]
1
iex(12)> map[2]
:two
iex(13)> # Maps are much better for pattern matching
iex(14)> %{:one => one} = %{:one => 1, 2 => :two}
%{2 => :two, :one => 1}
iex(15)> one
1
iex(16)> # To get or put, use the following syntax
iex(17)> Map.get(%{:a => 1, 2 => :b}, :a)
1
iex(18)> Map.put(%{:a => 1, 2 => :b}, :three, 3)
%{2 => :b, :a => 1, :three => 3}
iex(19)> # Update maps using the following syntax. The key must exist for the update to happen.
iex(20)> %{map | 2 => "two two cute"}
%{2 => "two two cute", :one => 1}
iex(21)> # When all the keys in maps are atoms, you can use keyword syntax
nil
iex(22)> map = %{one: 1, two: 2}
%{one: 1, two: 2}
iex(23)> map.one # Another way to access atom keys
1
iex(24)> map.two
2
```
Nested data structures are valid in Elixir
```elixir
iex(26)> example_nesting = [
...(26)> me: %{name: "Cate", age: 19, languages: ["English", "Polish", "Python"]},
...(26)> brata: %{name: "Joseph", age: 16, languages: ["English", "Spanish", "Java"]}
...(26)> ]
[
  me: %{age: 19, languages: ["English", "Polish", "Python"], name: "Cate"},
  brata: %{age: 16, languages: ["English", "Spanish", "Java"], name: "Joseph"}
```

