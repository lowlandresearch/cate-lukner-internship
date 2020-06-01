# Example Code of Debugging Chapter

The IO.inspect(item, opts \\ []) is useful for debugging since it returns the item argument, but does not effect the original code's behaviour. No need for print statements XD. It also allows labels for the items. Using `IO.inspect binding()` allows you to inspect the arguments passed into the function. Below is an example with IO.inspect and some of its different uses: 
```elixir
iex(1)> 1..10 |> IO.inspect |> IO.inspect(label: "This is with a label: ") |> Enum.map(fn x-> IO.inspe
ct binding() end)
1..10
This is with a label: : 1..10
[x: 1]
[x: 2]
[x: 3]
[x: 4]
[x: 5]
[x: 6]
[x: 7]
[x: 8]
[x: 9]
[x: 10]
[
  [x: 1],
  [x: 2],
  [x: 3],
  [x: 4],
  [x: 5],
  [x: 6],
  [x: 7],
  [x: 8],
  [x: 9],
  [x: 10]
]
```

# Another option to IO.inspect binding() is IEx.pry. IEx.pry is one example of a more dynamic way to interact with debugged code. Below is an example of how IEx.pry may work for an imaginary project example_db with the function Example.amazing_function/2.
```elixir
iex(1)> Example.amazing_function(v1, v2)
Break reached: Example.amazing_function/2 (lib/example_db.ex:5)

    3: defmodule Example do
    4:   def double_sum(x, y) do
    5:     IEx.pry
    6:     hard_work(x, y)
    7:   end

pry(1)> v1
"variable one"
pry(2)> v2
"variable two"
```
