# EXAMPLES OF CODE FROM INTERACTIVE ELIXIR
Chapter 2


Some example with float type in Elixir
```elixir
iex(1)> 1.0
1.0
iex(2)> 1.0e-10
1.0e-10
iex(3)> round(3.58)
4
iex(4)> trunc(3.58)
3
```
Using `h` to find out information about a function 
```elixir
iex(5)> h round/1

                               def round(number)

  @spec round(number()) :: integer()

guard: true

Rounds a number to the nearest integer.

If the number is equidistant to the two nearest integers, rounds away from
zero.

Allowed in guard tests. Inlined by the compiler.

## Examples

    iex> round(5.6)
    6

    iex> round(5.2)
    5

    iex> round(-9.9)
    -10

    iex> round(-9)
    -9

    iex> round(2.5)
    3

    iex> round(-2.5)
    -3
```
Elixir contains the boolean type:
```elixir
iex(7)> true
true
iex(8)> true == false
false
```
Elixir provides ways to check the type of an item:
```elixir
iex(10)> is_boolean(true)
true
iex(11)> is_boolean(1)
false
iex(12)> h is_integer/1

                              def is_integer(term)

  @spec is_integer(term()) :: boolean()

guard: true

Returns true if term is an integer; otherwise returns false.

Allowed in guard tests. Inlined by the compiler.
iex(15)> is_binary("hellö")
true
iex(16)> byte_size("hellö")
6
iex(17)> String.length("hellö")
5
iex(18)> String.upcase("hellö")
"HELLÖ"
iex(19)> add = fn a, b -> a + b end
#Function<13.126501267/2 in :erl_eval.expr/5>
iex(20)> is_function(add)
true
iex(21)> double = fn a-> add.(a, a) end
#Function<7.126501267/1 in :erl_eval.expr/5>
iex(22)> double.(2)
4
Elixir uses both lists and charlists:
```elixir
iex(23)> list = [1, 2, 3]
[1, 2, 3]
iex(24)> hd(list)
1
iex(25)> tl(list)
[2, 3]
iex(26)> i 'hello' #charlist
Term
  'hello'
Data type
  List
Description
  This is a list of integers that is printed as a sequence of characters
  delimited by single quotes because all the integers in it represent printable
  ASCII characters. Conventionally, a list of Unicode code points is known as a
  charlist and a list of ASCII characters is a subset of it.
Raw representation
  [104, 101, 108, 108, 111]
Reference modules
  List
Implemented protocols
  Collectable, Enumerable, IEx.Info, Inspect, List.Chars, String.Chars
```
Elixir contains the tuple type
```elixir
iex(27)> tuple = {:ok, "hello"}
{:ok, "hello"}
iex(28)> elem(tuple, 1)
"hello"
iex(29)> put_elem(tuple, 1, "world")
{:ok, "world"}
```
