defmodule Calc do

  def fact(n) , do: fact(n, 1)
  def fact(0 , acc) , do: acc
  def fact(n , acc) , do: fact(n-1 , n * acc)
end

Calc.fact(235) |> IO.puts()
