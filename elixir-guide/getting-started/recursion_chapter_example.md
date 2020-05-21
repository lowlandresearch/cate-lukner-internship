# Example of code for a Recursion with Elixir

The function RecursivePrinting.greetings greets each name in the list given with the greeting given.

```elixir
defmodule RecursivePrinting do
	def greetings([], _greeting) do
		[]
	end
	def greetings([head | tail], greeting) do 
		["#{greeting} #{head}!\n" | greetings(tail, greeting)]
	end
end

IO.puts RecursivePrinting.greetings(["Sam", "Lizzie", "David"], "Greetings")
```
