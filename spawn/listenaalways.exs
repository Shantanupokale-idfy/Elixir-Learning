defmodule Person do

  def tell(receiver , message) do
    IO.puts "[#{inspect self()}] Sending #{message} to [#{inspect receiver}]"
    send receiver , {:ok , self() , message}
  end

  def listen do
    IO.puts "[#{inspect self()}] is listening "

    receive do
      {:ok, message} ->
        IO.puts "[#{inspect self()}] Recived #"
        # code
    end

  end
end
