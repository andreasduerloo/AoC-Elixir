{_result, content} = File.read("./02_checksum.txt")

input = content
  |> String.split("\n", trim: true)
  |> Enum.map(&String.split(&1))
  |> Enum.map(&Enum.map(&1, fn(s) -> String.to_integer(s) end))

# First star
input
|> Enum.map(&(Enum.max(&1) - Enum.min(&1)))
|> Enum.sum()
|> IO.puts

# Second star
defmodule Divide do
  def find_pair([_x]) do
    IO.puts "Something went wrong."
  end

  def find_pair(list) do
    [head | tail] = list
    candidates = Enum.filter(tail, fn(i) -> rem(head, i) == 0 || rem(i, head) == 0 end)
    if Enum.empty?(candidates) do # RECURSION
      find_pair(tail)
    else
      pair = [head | candidates]
      div(Enum.max(pair), Enum.min(pair))
    end
  end
end

input
|> Enum.map(&(Divide.find_pair(&1)))
|> Enum.sum()
|> IO.puts
