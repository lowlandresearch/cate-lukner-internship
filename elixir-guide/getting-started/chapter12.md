# Example Code from IO and File system Chapter 12

The IO module in Elixir is mainly for reading and writing standard input/output, standard error, files, and other IO devices.
```elixir
iex(1)> IO.gets(:stdio, "What do you want?")
What do you want? Nothing
" Nothing\n"
iex(2)> IO.puts(:stderr, "This is great.")
This is great.
:ok
```
The File module allows for the opening, clsoing, and reading files as IO devices.
Files are opened in binary mode, so the IO functions IO.binread/2 and IO.binwrite/2 should be used to read or write.
```elixir
iex(5)> {:ok, file} = File.open("File", [:write]) # A file is a processes, hence the pid. A closed file will result in an error since the processes ended.
{:ok, #PID<0.112.0>}
iex(6)> IO.binwrite(file, "Look mom! I am writing.")
:ok
iex(7)> File.close(file)
:ok
iex(8)> File.read("File")
{:ok, "Look mom! I am writing."}
iex(9)> # What if we recieve an error? Using the ! with a File function allow for better understanding of an error (r
ather than trying to deciper a error tuple)
iex(10)> File.read!("nonexistant_file")
** (File.Error) could not read file "nonexistant_file": no such file or directory
    (elixir 1.10.3) lib/file.ex:353: File.read!/1
```
The Path module will come in handy when working with funcitons in the File module that expect paths
```elixir
iex(11)> Path.join("random", "path")
"random/path"
iex(1)> Path.expand("~/File")
"/home/catluk/File"
```
Example use of iodata with IO
```elixir
iex(2)> string = "interesting"
"interesting"
ex(5)> IO.puts(['Charlists', ?\s, <<97, 114, 101>>, ?\s, string])
Charlists are interesting
:ok
```
