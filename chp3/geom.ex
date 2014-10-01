defmodule Geom do
  @moduledoc """
  caclulates geometric properties of shapes
  """

  @doc """
  Calculates the area of a rectangle given length and width
  """
  
@spec area({atom(), number(), number()}):: number()

  def area({shape, dim1, dim2}) do
    area(shape, dim1, dim2)
  end

@spec area(atom(), number(), number()):: number()
  defp area(:rectangle, length, width)  when length >= 0 and width >= 0 do
    length * width
  end

  defp area(:triangle, height, base) when height >= 0 and base >= 0 do
    height * (base / 2) 
  end

  defp area(:ellipse, a, b) when a >= 0 and b >= 0 do
    :math.pi() * a * b
  end

  defp area(_, _, _) do
    0
  end
end

