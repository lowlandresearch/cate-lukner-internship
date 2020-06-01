# Example Code from Sigils Chapters

Sigils are denoted by `~<letter>`. They can use various deliminators. As shown below, ~r denotates a regex sigil and different deliminators were used for the same expression:
```elixir
iex(1)> ~r<^[A-Z0-9]?$> # Regex sigil using <> as a deliminator
~r/^[A-Z0-9]?$/
iex(2)> ~r|^[A-Z0-9]?$| # Regex sigil using || as a deliminator
~r/^[A-Z0-9]?$/
```
Charlist sigils are denotated by ~c, as seen below. This can become useful when single quotes are used within the charlist. 
```elixir
iex(4)> 'why include \'single\' quotes' == ~c(why include 'single' quotes) # The sigil ~c is useful for charlists containing single quotes
true
```
String sigils are created with ~s. To not include escape sequences, use ~S.
```elixir
iex(25)> ~s(This string includes \s\s escapes)
"This string includes    escapes"
iex(26)> ~S(This string does not include \s\s escapes)
"This string does not include \\s\\s escapes"
```
Charlists, regex, and strings are not the only sigils:
```elixir
iex(11)> date = ~D/2020-05-22/ # Date sigils are created using ~D
~D[2020-05-22]
iex(12)> date.year
2020
iex(13)> time = ~T'12:48:00' # Time sigils are created using ~T
~T[12:48:00]
```
Below I created a custom sigil that greets in English when giving a string, but will greet in Polish if the optional `p` modifier is given.
```elixir
iex(19)> defmodule CustomSigil do
...(19)>   def sigil_g(string, []), do: "Hello"
...(19)>   def sigil_g(string, [?p]), do: "Dzien Dobry"
...(19)> end
iex(20)> ~g("Something")
"Hello"
iex(21)> ~g("Rzeczy")p
"Dzien Dobry"
```
