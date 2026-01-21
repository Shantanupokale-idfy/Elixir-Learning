defmodule Typewriter do

  def printfile(filename) do

    File.stream!(filename)
    |> Stream.map(&(String.replace(&1 , "\n" , " ")))
    |> Enum.each(&Typewriter.printline/1)
  end

   def printline(line) do
     line
     |> String.split("")
     |> Enum.each(&Typewriter.printchar/1)
     IO.write "\n"
     :timer.sleep 500
   end

   def printchar(char) do
     char
     |> IO.write
     :timer.sleep 100
   end


end


Typewriter.printfile("recursion.exs")
