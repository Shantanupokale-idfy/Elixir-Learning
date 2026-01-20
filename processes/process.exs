defmodule Demo do

  def work() do

    #run a long methiod
    :timer.sleep(5000)
    IO.puts  "I am done: #{:rand.normal()} "
  end


  def run do
    spawn fn ->
    work()

    end
  end
end


pid = Demo.run()

pid |> IO.inspect()

IO.puts("doing other stuff")
