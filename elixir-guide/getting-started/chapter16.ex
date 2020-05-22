# Example Code of Protocols

# Include protocal with struct

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

# Include use of this protocal, as well as use of built-in prototcals

