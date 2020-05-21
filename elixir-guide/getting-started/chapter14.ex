# Example of Using the Module Attributes

defmodule Foo do
	@moduledoc """
	
	The sole purpose of this module is to demonstrate the use
	of module attributes.
	"""

	@doc """
	This is some imaginary function that does something
	legendary.
	"""
	@constant %{name: "Catherine", siblings: 4}
	def legendary do
		@constant
	end
	@constant "No"
	def unlegendary do
		IO.puts "Was that legendary? "
		@constant
	end

end

