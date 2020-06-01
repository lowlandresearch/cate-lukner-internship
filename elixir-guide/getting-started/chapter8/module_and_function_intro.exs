# This is a file that contains a module for scripting purposes

defmodule Fun_Math do
	def divide(a, b) do
		do_div(a, b)
	 end

	defp do_div(a, b) do
		a / b
	 end
	end

IO.puts Fun_Math.divide(3, 4444)
IO.puts Fun_Math.divide(3, 3)
