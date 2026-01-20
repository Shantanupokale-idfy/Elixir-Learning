defmodule Demo do

def run do
  try do
    Keyword.fetch!([] , :a)

  rescue
    KeyError -> IO.puts("key not fiund")

  after #finally and will alwys execute
  IO.puts("i will execute no matter what happens")

else
  #execute only if no errors are their
  end
 end

end

Demo.run() |> IO.inspect()
