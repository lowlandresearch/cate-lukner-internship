# Example module with alias, import, and use. 

defmodule UsingImport do
	def import_ex do
		import String, only: [valid?: 1]
		IO.puts valid?("This is a string")
	end
end

defmodule Require do
	require UsingImport
	alias UsingImport.import_ex	
end

