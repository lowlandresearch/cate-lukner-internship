# EXAMPLE CODE FROM BASIC OPERATORS CHAPTER:

The operator `<>` can be used to concatenate strings.
```elixir
iex(1)> "foo" <> "bar"
"foobar"
```
Elixir also can use boolean operators or, and, & not, between booleans or ||, &&, and ! between nonboolean types.
```elixir
iex(2)> true or false
true
iex(3)> 1 || true
1
iex(4)> true and raise("It will notice")
** (RuntimeError) It will notice

iex(4)> false and raise("It will not notice")
false
iex(5)> 1 || false
1
```
Elixir contains comparison operators.
```elixir
iex(6)> 1 < 2
true
iex(7)> 1 <= 2
true
iex(8)> 1 == 1.0
true
iex(9)> 1 == 1.0 # less strict
true
iex(10)> 1 === 1.0 # more strict
false
iex(11)> 1 < :atom
```
