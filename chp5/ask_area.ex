defmodule AskArea do
  @moduledoc"""
  Command line interface for calculating areas
  """

  @doc"""
  Gets the shape and dimensions before calling the requisite 
  area function
  """

  def area() do
    input = IO.gets("R\)ectangle, T\)riangle, or E)\llipse:  ")
    shape =  char_to_shape(String.first(input))
    {dim1, dim2} = case shape do
      :rectangle -> get_dimensions("width", "height")
      :triangle  -> get_dimensions("base", "height")
      :ellipse   -> get_dimensions("major radius", "minor radius")
      :unknown   -> {String.first(input), 0}
    end
    calculate( shape, dim1, dim2 )
  end
 
  def char_to_shape(character) do
    cond do
      String.upcase(character) == "R" -> :rectangle
      String.upcase(character) == "T" -> :triangle
      String.upcase(character) == "E" -> :ellipse
      true -> :unknown
    end
  end

  @spec get_dimensions( String.t(), String.t()) :: tuple()
  defp get_dimensions( prompt1, prompt2 ) do
    n1 = get_number(prompt1)
    n2 = get_number(prompt2)
    {n1, n2}
  end

  @spec get_number( String.t() ) :: number() 
  defp get_number(prompt) do
    input = IO.gets("Enter #{prompt} >")
    String.to_integer( (String.strip(input)) )
  end

  @spec calculate( atom(), number(), number()) :: number()
  def calculate( shape, dim1, dim2 ) do
    cond do 
      shape == :unknown -> IO.puts("Unknown shape #{dim1}")
      dim1 < 0 or dim2 < 0 ->
        IO.puts("Positive non-zero numbers, dumbass")
      true -> Geom.area(shape, dim1, dim2)
    end
  end
end
