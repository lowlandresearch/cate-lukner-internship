# Example Code of Structs

Below is an example of creating a struct with an enforced key (:name), a key with a default of nil (:age), and other keys with defaults. It also includes examples of using and updating the struct.
```elixir
iex(5)> defmodule ExampleStruct do
...(5)>     @enforce_keys [:name]
...(5)>     defstruct [:age, :name, occupation: "Programmer", intrests: "Computer Science"]
...(5)> end
warning: redefining module ExampleStruct (current version defined in memory)
  iex:5

{:module, ExampleStruct,
 <<70, 79, 82, 49, 0, 0, 10, 24, 66, 69, 65, 77, 65, 116, 85, 56, 0, 0, 1, 26,
   0, 0, 0, 27, 20, 69, 108, 105, 120, 105, 114, 46, 69, 120, 97, 109, 112, 108,
   101, 83, 116, 114, 117, 99, 116, 8, 95, ...>>,
 %ExampleStruct{
   age: nil,
   intrests: "Computer Science",
   name: nil,
   occupation: "Programmer"
 }}
iex(6)> %ExampleStruct{} # This will error since the name key is required
** (ArgumentError) the following keys must also be given when building struct ExampleStruct: [:name]
    expanding struct: ExampleStruct.__struct__/1
    iex:6: (file)
iex(6)> %ExampleStruct{name: "Catherine"}
%ExampleStruct{
  age: nil,
  intrests: "Computer Science",
  name: "Catherine",
  occupation: "Programmer"
}
iex(7)> Cate = %ExampleStruct{name: "Catherine"}
** (MatchError) no match of right hand side value: %ExampleStruct{age: nil, intrests: "Computer Science", name: "Catherine", occupation: "Programmer"}

iex(7)> cate = %ExampleStruct{name: "Cate"} # Assigning a variable to a struct
%ExampleStruct{
  age: nil,
  intrests: "Computer Science",
  name: "Cate",
  occupation: "Programmer"
}
iex(8)> joseph = %{cate | name: "Joseph"} # Creating a new struct from another
%ExampleStruct{
  age: nil,
  intrests: "Computer Science",
  name: "Joseph",
  occupation: "Programmer"
}
iex(9)> joseph.intrests # Accessing a value from a struct
"Computer Science"
iex(10)> Map.keys(joseph) # Example use of functions from Map (since structs are bare maps)
[:__struct__, :age, :intrests, :name, :occupation]
iex(11)>
nil
iex(12)> joseph = %{joseph | age: 16} # updating the same struct
%ExampleStruct{
  age: 16,
  intrests: "Computer Science",
  name: "Joseph",
  occupation: "Programmer"
}
```

