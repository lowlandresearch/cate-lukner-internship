# Code Examples from Binaries, Strings, and Charlists
```elixir
iex(1)> # The code pointe is what we store, for example, the code point of a is:"
nil
iex(2)> ?a
97
iex(3)> # You can see the binary representation of a string by concatenating with <<0>> or using IO.inspect:
nil
iex(4)> "hello" <> <<0>>
<<104, 101, 108, 108, 111, 0>>
iex(5)> IO.inspect("hello", binaries: :as_binaries)
<<104, 101, 108, 108, 111>>
"hello"
iex(6)> "The bitstring is a fundamental data type in Elixir. It is a contiguous sequence of bits in memory, donated with <<>>"
"The bitstring is a fundamental data type in Elixir. It is a contiguous sequence of bits in memory, donated with <<>>"
iex(8)> <<42>> === <<42::8>>
true
iex(9)> <<98>> === <<98::8>>
true
iex(10)> # A binary is a bitstring where the bits is divisible by 8. Every binary is a bitstring but every bitstring is not a binary
nil
iex(11)> is_bitstring(<<98::8>>)
true
iex(12)> is_binary(<<98::8>>)
true
iex(13)> is_bitstring(<<8::4>>)
true
iex(14)> is_binary(<<8::4>>)
false
iex(15)> # Binaries and bitstrings can be matched. The :: binary modifier can be used to match a binary of unknown size
nil
iex(16)> <<5, 6, y :: binary >> = <<5, 6, 7, 8>>
<<5, 6, 7, 8>>
iex(17)> y
"\a\b"
iex(18)> <<5, 6, y :: binary >> = <<5, 6, 2, 3>>
<<5, 6, 2, 3>>
iex(19)> y
<<2, 3>>
iex(20)> # All strings are binaries (but the reverse is not always true)
nil
iex(21)> is_binary("great")
true
iex(22)> # A charlist is a list of integers where all the integers are valid code points
nil
iex(23)> # Strings use double-quotes, charlists use single-quotes
nil
iex(24)> String.valid?("string example")
true
iex(25)> String.valid?('charlist example')
false
iex(26)> is_list 'charlist example'
true
iex(30)> IO.inspect('charlist example', charlists: :as_lists)
[99, 104, 97, 114, 108, 105, 115, 116, 32, 101, 120, 97, 109, 112, 108, 101]
'charlist example'
iex(31)> # Char lists are the reason why IEx will interpret a list at times to corresponding ASCII characters
nil
iex(32)> # <> is a string operator, ++ is a charlist operator
nil
iex(33)> "Concatenate" <> "this string"
"Concatenatethis string"
iex(34)> 'That did not' ++ ' work well since I forgot a space.'
'That did not work well since I forgot a space.'
```

