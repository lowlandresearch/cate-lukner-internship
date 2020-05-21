# Example module with alias, import, require, and use. 

Below are example modules of using alias, import, require, and use.
```elixir
defmodule UsingImport.Example do
	def import_valid do
		import String, only: [valid?: 1]
		IO.puts valid?("This is a string")
	end
end

defmodule UsingAlias do
	alias UsingImport.Example, as: ImEx
	def check_string do
		ImEx.import_valid
	end
end

defmodule UsingRequire do
	require UsingAlias
	if UsingAlias.check_string do
		IO.puts "Yes, UsingImport did contain a valid string"
	end
end

defmodule SetUpForUse do
	defmacro __using__(_) do
		quote do
			def somthing(string), do: IO.puts("You gave me " <> "#{string}")	
		end
	end
end

defmodule UsingUse do
	use SetUpForUse
end
```

