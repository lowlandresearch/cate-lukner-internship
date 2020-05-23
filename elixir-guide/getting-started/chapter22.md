# Example code of Erlang Modules

The Erland libraries chapter introduced a variety of modules. Below I have included examples of each modulediscussed.

The binary module is useful in handling data that may not be UTF-8 encoded
```elixir
iex(3)> :binary.bin_to_list "ÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß"
[195, 144, 195, 145, 195, 146, 195, 147, 195, 148, 195, 149, 195, 150, 195, 151,
 195, 152, 195, 153, 195, 154, 195, 155, 195, 156, 195, 157, 195, 158, 195, 159]
```

The Erlang functions :io.format/2 and :io_lib.format are useful in replacing printf function that Elixir does not have
```elixir
iex(5)> :io.format("This is a formated print. ~n See?", []) # formats to terminal output
This is a formated print.
 See?:ok
iex(6)> :io_lib.format("Now let's try to format a number: ~4..0B", [3]) # formats to an iolist
'Now let\'s try to format a number: 0003'
```

The crypto module hands hashing, digital signatures, encryption, and more. Here is an example of creating a hash:
```elixir
iex(8)> :crypto.hash(:md5, "Super secret")
<<253, 217, 20, 236, 171, 92, 165, 101, 254, 38, 141, 145, 146, 52, 168, 152>>
iex(9)> Base.encode16(:crypto.hash(:md5, "Super secret"))
"FDD914ECAB5CA565FE268D919234A898"
```

The diagraph module contains functions for dealing with directed graphs built of vertices and edges.
```elixir
iex(2)> dgr = :digraph.new()
{:digraph, #Reference<0.2843293805.270925832.152140>,
 #Reference<0.2843293805.270925832.152141>,
 #Reference<0.2843293805.270925832.152142>, true}
iex(3)> :digraph.add_vertex(dgr, "edgie")
"edgie"
iex(4)> :digraph.add_vertex(dgr, "edgier")
"edgier"
iex(5)> :digraph.add_vertex(dgr, "edgiest")
"edgiest"
iex(6)> :digraph.add_edge(dgr, "egie" "edgier")
** (SyntaxError) iex:6: syntax error before: "edgier"

iex(6)> :digraph.add_edge(dgr, "egie", "edgier")
{:error, {:bad_vertex, "egie"}}
iex(7)> :digraph.add_edge(dgr, "edgie", "edgier")
[:"$e" | 1]
iex(8)> :digraph.add_edge(dgr, "edgie", "edgiest")
[:"$e" | 2]
```

The ETS module handles storage of large data structures in memory. (The dets module allows for storage only a disk). The ETS module allows you to create a protected table containing tuples along with some functionality.
```elixir
iex(12)> table = :ets.new(:ets_test, [])
#Reference<0.3328630305.4285923332.193792>
iex(13)> :ets.insert(table, {"Row one", 1})
true
iex(14)> :ets.insert(table, {"Row two", 2})
true
iex(15)> :ets.insert(table, {"Row three", 3})
true
iex(16)> :ets.i(table)
<1   > {<<"Row three">>,3}
<2   > {<<"Row one">>,1}
<3   > {<<"Row two">>,2}
EOT  (q)uit (p)Digits (k)ill /Regexp -->q
:ok
```

The math module allows for common mathematical oeprations.
```elixir
iex(18)> :math.exp(44.0)
1.2851600114359308e19
iex(19)> :math.sinh(45)
1.7467135528742547e19
iex(20)> :math.fmod(2, 3)
2.0
```

The queue module allows the creation of a queue data structure that efficiently implements first-in first-out queues:
```elixir
iex(22)> que = :queue.new
{[], []}
iex(23)> que = :queue.in("Thing one", que)
{["Thing one"], []}
iex(24)> que = :queue.in("Thing two", que)
{["Thing two"], ["Thing one"]}
iex(25)> que = :queue.in("Thing three", que)
{["Thing three", "Thing two"], ["Thing one"]}
iex(26)> que = :queue.in("Thing four", que)
{["Thing four", "Thing three", "Thing two"], ["Thing one"]}
iex(27)> que = :queue.in("Thing five", que)
{["Thing five", "Thing four", "Thing three", "Thing two"], ["Thing one"]}
iex(28)> {value, que} = :queue.out(que)
{{:value, "Thing one"},
 {["Thing five", "Thing four", "Thing three"], ["Thing two"]}}
iex(29)> value
{:value, "Thing one"}
iex(30)> {value, que} = :queue.out(que)
{{:value, "Thing two"}, {["Thing five", "Thing four"], ["Thing three"]}}
iex(31)> value
{:value, "Thing two"}
iex(32)> {value, que} = :queue.out(que)
{{:value, "Thing three"}, {["Thing five"], ["Thing four"]}}
iex(33)> value
{:value, "Thing three"}
iex(34)> {value, que} = :queue.out(que)
{{:value, "Thing four"}, {[], ["Thing five"]}}
iex(35)> value
{:value, "Thing four"}
iex(36)> {value, que} = :queue.out(que)
{{:value, "Thing five"}, {[], []}}
iex(37)> value
{:value, "Thing five"}
iex(38)> {value, que} = :queue.out(que)
{:empty, {[], []}}
iex(39)> value
:empty
```

The rand module contains functions for all your random needs (values, seeds, etc.)
```elixir
iex(41)> :rand.uniform() # simple use of creating a seed with a default algorithim
0.47156926374482655
iex(42)> :rand.uniform_real()
0.4413513714534693
iex(43)> :rand.seed_s(:exs1024s)
{%{
   bits: 64,
   jump: #Function<19.8986388/1 in :rand.mk_alg/1>,
   next: #Function<18.8986388/1 in :rand.mk_alg/1>,
   type: :exs1024s,
   weak_low_bits: 3
 },
 {[9799797348960493197, 3883521977690518961, 13665693763368903568,
   16328613798758344148, 10998153672406333411, 15967438815251170401,
   4707345464978987933, 16097456746149778616, 3463881589171048342,
   5954196497310717896, 7518353957726274020, 5404872937535948874,
   18109918298862098440, 15312646831893058787, 18023248319914505076,
   8577927774653637520], []}}
iex(44)> :rand.seed(:exs1024s)
{%{
   bits: 64,
   jump: #Function<19.8986388/1 in :rand.mk_alg/1>,
   next: #Function<18.8986388/1 in :rand.mk_alg/1>,
   type: :exs1024s,
   weak_low_bits: 3
 },
 {[7037932418058638526, 17640150673113136739, 15670817647133269113,
   10662393158646650575, 1684828765043905753, 17716106057938724731,
   11389236489515121442, 15569796240821057, 15425926826047600754,
   17633317797567336655, 1236169386544944119, 15754443040597211108,
   542166932296296524, 7484202940387795548, 1485789647747811599,
   3035333548085988416], []}}
```

The zip module reads and writes ZIP files to and from disk or memory and also extracting file info
```elixir
iex(2)> files = File.ls!("/home/catluk/cate-lukner-internship/elixir-guide/getting-started") |> Enum.map(fn filename -> Path.join("/home/catluk/cate-lukner-internship/elixir-guide/getting-started", filena
me) end) |> Enum.map(&String.to_charlist/1)
['/home/catluk/cate-lukner-internship/elixir-guide/getting-started/README.md',
--snip--
'/home/catluk/cate-lukner-internship/elixir-guide/getting-started/chapter9.md']
iex(3)> :zip.create("RandomZipFolder.zip", files)
{:ok, "RandomZipFolder.zip"}
iex(4)> ls
README.md               RandomZipFolder.zip     chapter10.md            chapter11
--snip--
```
The zlib module compresses data into a zlib format. For example:
```elixir
iex(53)> data = "Data and more data and data and data and data and super precious data that is very long and I don't know how long I will be typing. I want to stop now but I want to create some super long data honestly this run on sentence is like sentences in Polish they just keep going and going and going and going and going."
"Data and more data and data and data and data and super precious data that is very long and I don't know how long I will be typing. I want to stop now but I want to create some super long data honestly this run on sentence is like sentences in Polish they just keep going and going and going and going and going."
iex(54)> compress_data = :zlib.compress(data)
<<120, 156, 141, 142, 75, 14, 131, 48, 12, 68, 175, 50, 187, 238, 56, 69, 55,
  236, 122, 133, 0, 22, 73, 9, 118, 20, 59, 69, 220, 190, 33, 165, 85, 87, 85,
  23, 150, 198, 227, 207, 188, 171, 51, 7, 199, 19, 86, 201, 132, 233, ...>>
iex(55)> :zlib.uncompress(compress_data)
"Data and more data and data and data and data and super precious data that is very long and I don't know how long I will be typing. I want to stop now but I want to create some super long data honestly this run on sentence is like sentences in Polish they just keep going and going and going and going and going."
```


