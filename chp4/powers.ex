defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3] 

  @doc"""
    anything to the power of 0 is 1
  """

  def raise(_,0) do
    1
  end
    
  @doc"""
    negative powers are the inverse of the power
  """
  def raise(x,n) when n < 0 do
    1.0 / raise(x, -n)
  end

  def raise(x,n) when n > 0 do 
    raise(x, n, 1)
  end


  @spec raise(number(), number(), number()) :: number()

  defp raise(_x, 0, accumulator) do
    accumulator
  end

  defp raise(x, n, accumulator) do
    raise(x, n-1, x * accumulator)
  end   


  @doc """
  calculates the roots of a number by the newton-raphson method
  """
  @spec nth_root(number(), number()) :: number()

  def nth_root(x,n) do
    nth_root(x, n, x / 2.0)
  end

  @spec nth_root(number(), number(), number()) :: number()

  defp nth_root(x,n,estimate) do
    IO.puts("Current guess is #{estimate}")
    f = raise(estimate, n) - x
    f_prime = n * raise(estimate, n - 1)
    next = estimate - f / f_prime
    change = abs(estimate - next)
    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n, next)
    end
  end
end
