# Example code of Typespecs and behaviors

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
     
defmodule PersonBehaviour do
  defstruct name: nil, age: nil, language: "Polish"
  
  @callback what_language(%PersonBehaviour{}) :: String.t 
  @callback young?(%PersonBehaviour{}) :: Boolean.t 

end

defmodule WhoAreYou do
  @behaviour PersonBehaviour
  
  @impl PersonBehaviour
  def what_language(struct), do: "Sooo...you speak #{struct.language}"
  
  @impl PersonBehaviour
  def young?(struct), do: struct.age <= 50

end
