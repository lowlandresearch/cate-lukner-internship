# Example Module containing a process with a recieve block.

defmodule SimpleProcess do
    def say_hello() do
	receive do
            _ ->
		IO.puts("Hello to you!")
        end
    end
end

