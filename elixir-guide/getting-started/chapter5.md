# Case, Cond, If Chapter Code Examples

Cond, Case, and If chapter went over the uses of case, cond, and if/unless
```elixir
iex(4)> case {1, 3, :ok} do
...(4)> {2, _, _} -> "This will not match"
...(4)> {1, 3, _} -> "This will match"
...(4)> _ -> "Doesn't matter if this matches"
...(4)> end
"This will match"
```
Clauses can have guards. Anonymous functions can also have guards
```elixir
iex(6)> function = fn
...(6)> x when x > 0 -> 3 / x
...(6)> x -> 3 / (x+1)
...(6)> end
#Function<7.126501267/1 in :erl_eval.expr/5>
iex(7)> function.(3)
1.0
iex(8)> function.(0)
3.0
```
Cond allows you to check different conditions, finding the first one that does not evaluate to nil/false
```elixir
iex(10)> cond do
...(10)> "totally" <> "false" == "totally true" -> "This will not be true"
...(10)> 2 + 3 <= 6 -> "yay"
...(10)> true -> "Even though this is true, it will not evaluate since the above is true."
...(10)> end
"yay"
```
If and unless check for one conditon, adding else will allow for something else to run if they do not.
```elixir
iex(13)> if nil do
...(13)> "This will not be seen"
...(13)> end
nil
iex(14)> unless false do
...(14)> "This will be seen"
...(14)> end
"This will be seen"
iex(15)> if 2 + 2 == 22 do
...(15)> "No, Vine, that isn't true."
...(15)> else
...(15)> "Vine sold me lies"
...(15)> end
"Vine sold me lies"
```

