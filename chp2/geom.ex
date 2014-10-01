defmodule Geom do
  @moduledoc """
  caclulates geometric properties of shapes
  """

  @doc """
  Calculayes the area of a rectangle given length and width
  """
  
@spec area(number(), number()):: number()
  def area(length \\ 1, width \\ 1) do
    length * width
  end
end

