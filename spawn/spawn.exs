defmodule Demo do

  def work do
    IO.puts "Work process"

    exit :error

  end

  def run do
    spawn fn -> work() end
    IO.puts "Doing something else ..."
  end
end

Demo.run()
