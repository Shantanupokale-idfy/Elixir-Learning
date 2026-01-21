defmodule Demo do

  def work do
    IO.puts("I am busy")
    result = receive do
      message ->  message
    end

    IO.inspect result

  end

  def run(message) do
    pid = spawn fn ->
      work()
    end
    send pid , message
  end

end

Demo.run("hiiiiiii")
