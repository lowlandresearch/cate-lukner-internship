# PATTERN MATCHING CODE EXAMPLES

The `=` in elixir is used to assign, but also to pattern match
```elixir
iex(1)> x = 1
1
iex(2)> x
1
iex(3)> x = 1 # matches x to 1
1
iex(4)> 1 = x # 1 matches to x
1
iex(5)> 2 = x # 2 does not match to x
** (MatchError) no match of right hand side value: 1

iex(5)> {a, b, c} = {:hello, "world", 42}
{:hello, "world", 42}
iex(6)> # above code matched the two tuples
nil
iex(7)> a
:hello
iex(8)> b
"world"
```
Matches can be done between lists and tuples, but their type must match.
```elixir
iex(10)> [head | tail] = [1, 2, 3] # This is cool, it matches the head and tail of the list
[1, 2, 3]
iex(11)> head
1
iex(12)> tail
[2, 3]
iex(13)> x = 1
1
```
Pin operator' matches against x's existing value
```elixir
iex(14)> ^x = 2 
** (MatchError) no match of right hand side value: 2

iex(14)> x = 1
1
iex(15)> [^x, 2, 3] = [1, 2, 3] # true since x is pinned
[1, 2, 3]
iex(16)> {y, ^x} = {2, 1} # true since x is pinned
{2, 1}
```
The underscore can be used as a match to anything.
```elixir
iex(17)> [head | _] =  [1, 2, 3] # we don't care about tail, only the head, so we have the tail as an _
[1, 2, 3]
iex(18)> head
1
iex(19)> _ # will not be assigned to anything
** (CompileError) iex:19: invalid use of _. "_" represents a value to be ignored in a pattern and cannot be used in expressions
```
A function cannot be on the left side of a match.
```elixir
iex(19)> length([1, [2], 3]) = 3 # will not work since pattern matching does not allow function calls on left side
** (CompileError) iex:19: cannot invoke remote function :erlang.length/1 inside a match
```

