# This file is a module that contains a guard and uses a slightly different syntax

defmodule Boring_Math do
	def one?(1), do: :"Yes, that is a one"
	def one?(x) when is_integer(x), do: :"No that is not a one"
end
