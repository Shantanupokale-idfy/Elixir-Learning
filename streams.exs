defmodule Streams do
 def tranform do
   [1,2,3,4,5,6]
    |> Enum.map(fn n -> n * 2 end) # can also so
  # |> Enum.map(&(&1 * 2 )).   take first argument and multiply by 2
    |> Enum.drop_every(3)
    |> Enum.reduce(0, fn c,p -> c + p end)
  # |> Enum.reduce(0,&(&1 + &2 ))
  end
end

Streams.tranform |> IO.inspect()
