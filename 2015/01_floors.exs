{_result, content} = File.read("./01_floors.txt")

chars = String.split(content, "")

# First star
down = Enum.count(chars, &(&1 == ")"))
IO.puts((String.length(content) - down) - down)

# Second star
defmodule Floors do
  def calc(list, floor, index) do
    if floor == -1 do
      IO.puts index - 1
    else
      cond do # RECURSION
        hd(list) == "(" ->
          calc(tl(list), floor + 1, index + 1)
        hd(list) == ")" ->
          calc(tl(list), floor - 1, index + 1)
        true ->
          calc(tl(list), floor, index + 1)
      end
    end
  end
end

Floors.calc(chars, 0, 0)

# Enum.with_index()
# |> Map.new(fn {value, index} -> {index, value} end)
# |> Map.get instead of Enum.at, better performance
