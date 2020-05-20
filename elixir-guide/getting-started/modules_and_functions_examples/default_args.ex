defmodule Defaulting do
	def hardwork(x, y \\ nil, sep \\ :"trying to work") 
	
	def hardwork(x, y, _sep) when is_nil(y) do
		IO.puts "You didn't provide a y"
	end
	
	def hardwork(x, y, sep) do
		x <> sep <> y
	end
     end

