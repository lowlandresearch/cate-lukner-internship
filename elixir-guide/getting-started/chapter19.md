# Example Code try, rescue, and catch

Below is an example of creating a new error, using `raise` to raise it within a `try/rescue` block.
```elixir
iex(1)> defmodule NewError do
...(1)>     defexception message: "This was such a horrible error"
...(1)> end
{:module, NewError,
 <<70, 79, 82, 49, 0, 0, 13, 144, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 1, 73,
   0, 0, 0, 33, 15, 69, 108, 105, 120, 105, 114, 46, 78, 101, 119, 69, 114, 114,
   111, 114, 8, 95, 95, 105, 110, 102, 111, ...>>, :ok}
iex(2)> try do
...(2)>     raise NewError
...(2)> rescue
...(2)>     err in NewError -> err
...(2)> end
%NewError{message: "This was such a horrible error"}
```
Below is an example of defining a try block within a module that also includes else and after blocks.
```elixir
iex(1)> defmodule TryBlock do
...(1)>   def sqrt(x) do
...(1)>     try do
...(1)>       :math.sqrt(x)
...(1)>     rescue
...(1)>       ArithmeticError -> :bad_arg
...(1)>     else
...(1)>       _ -> :good_arg
...(1)>     after
...(1)>       IO.puts "Well, there isn't much to clean up"
...(1)>   end
...(1)>   end
...(1)> end
{:module, TryBlock,
 <<70, 79, 82, 49, 0, 0, 6, 240, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 1, 6, 0,
   0, 0, 26, 15, 69, 108, 105, 120, 105, 114, 46, 84, 114, 121, 66, 108, 111,
   99, 107, 8, 95, 95, 105, 110, 102, 111, ...>>, {:sqrt, 1}}
iex(2)> TryBlock.sqrt(-1)
Well, there isn't much to clean up
:bad_arg
iex(3)> TryBlock.sqrt(1)
Well, there isn't much to clean up
:good_arg
```
Below is an example of using a `try/catch` block with `throw`.
```elixir
iex(1)> import Integer
Integer
iex(2)> try do
...(2)>   Enum.each -2..2, fn(x) ->
...(2)>     if Integer.is_even(x), do: throw(x)
...(2)>   end
...(2)>   "No even numbers"
...(2)> catch
...(2)>   x -> "Turns out #{x} is even."
...(2)> end
"Turns out -2 is even."
```
Below is an example of using exit within a `try/catch` block.
```elixir
iex(1)> try do
...(1)>   exit "Catch is going to stop me!"
...(1)> catch
...(1)>   :exit, _-> "Told you so"
...(1)> end
"Told you so"
```

