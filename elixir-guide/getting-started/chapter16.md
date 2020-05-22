# Example Code of Protocols

Below is an example of a protocal that counts the items of various types. It also is defined for a struct and will fall back to Any if the defimpl is not defined for the type passed as an argument.
```elixir
defprotocol CountItems do
	@doc """
	Counts the number of items
	"""
	@fallback_to_any true
	def count(data)
end

defimpl CountItems, for: BitString do
	def count(string), do: String.length(string)
end

defimpl CountItems, for: List do
	def count(list), do: length(list)
end

defimpl CountItems, for: Map do
	def count(map), do: map_size(map)
end

defimpl CountItems, for: Tuple do
	def count(tuple), do: tuple_size(tuple)
end

defmodule ExampleStruct do	
	defstruct [:item, :color]
	
end

defimpl CountItems, for: ExampleStruct do
	def count(_struct), do: 2
end

defimpl CountItems, for: Any do
	def count(_), do: {:error, "Unknown data type. Write a defimpl for it."}
end
```
Below are examples of how to use the protocal defined above. 
```elixir
iex(2)> CountItems.count(pen)
2
iex(3)> CountItems.count("Random string")
13
iex(4)> CountItems.count([1, 2, 3, 4, 5, 6])
6
iex(5)> CountItems.count({1, 2, 3, 4, 5, 6})
6
iex(6)> CountItems.count(%{one: 1, two: 2, three: 3, four: 4, five: 5, six: 6})
6
iex(1)> CountItems.count(:unknown)
{:error, "Unknown data type. Write a defimpl for it."}
```

