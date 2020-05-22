# Example Code of Typespec and Behaviours

The following module creates the type `person` defined by a struct. It contains the spec `who_are_you` which prompts the user with the necessary information to build the struct.
```elixir
defmodule PersonType do
  @typedoc """
  Defines the person and their language
  """
  defstruct name: nil, age: nil, language: "English"

  @type person :: %PersonType{name: String.t, age: number, language: String.t}
  
  import Integer 

  @spec who_are_you() :: person
  def who_are_you() do
    name_im = IO.gets "What is you name? "
    age_im = IO.gets "What is your age?  "
    language_im = IO.gets "What language do you speak? "
    %PersonType{name: name_im, age: Integer.parse(age_im), language: language_im} 
  end
end
     
```
The spec of the type can be used as follows:
```elixir
iex(1)> PersonType.who_are_you()
What is you name? Catherine
What is your age?  19
What language do you speak? English
%PersonType{age: {19, "\n"}, language: "English\n", name: "Catherine\n"}
```
Below is an example of a behaviour that defines a struct that contains information about a person. Its callback `what_language` gives a string type, while its callback `young?` gives a boolean type.
```elixir
defmodule PersonBehaviour do
  defstruct name: nil, age: nil, language: "Polish"
  
  @callback what_language(%PersonBehaviour{}) :: String.t 
  @callback young?(%PersonBehaviour{}) :: boolean() 

end

defmodule WhoAreYou do
  @behaviour PersonBehaviour
  
  @impl PersonBehaviour
  def what_language(struct), do: "Sooo...you speak #{struct.language}"
  
  @impl PersonBehaviour
  def young?(struct), do: struct.age <= 50

end
```
As an example, the behaviour can be used as follows:
```elixir
iex(3)> catherine = %PersonBehaviour{age: 19, name: "Catherine"}
%PersonBehaviour{age: 19, language: "Polish", name: "Catherine"}
iex(4)> WhoAreYou.young?(catherine)
true
iex(5)> WhoAreYou.what_language(catherine)
"Sooo...you speak Polish"
```
