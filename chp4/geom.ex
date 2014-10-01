defmodule Geom do
  @moduledoc """
  caclulates geometric properties of shapes
  """

  @doc """
  Calculates the area of a rectangle given length and width
  """
  
@spec area(atom(), number(), number()):: number()

  def area(shape, dim1, dim2) when dim1 >= 0 and dim2 >= 0 do
    case shape do
      :rectangle -> dim1 * dim2
      :triangle -> dim1 * (dim2/2)
      :ellipse  -> :math.pi() * dim1 * dim2
    end
  end
end
