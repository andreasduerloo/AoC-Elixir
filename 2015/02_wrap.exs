{_result, content} = File.read("./02_wrap.txt")

defmodule Wrapping do
  def paper(dimensions) do
    dimensions = String.split(dimensions, "x") |> Enum.map(&(String.to_integer(&1)))
    shortest = Enum.sort(dimensions) |> Enum.take(2)
    surface(dimensions) + Enum.product(shortest)
  end

  defp surface(dimensions) do
    [a, b, c] = dimensions
    2 * (a*b + a*c + b*c)
  end

  def ribbon(dimensions) do
    dimensions = String.split(dimensions, "x") |> Enum.map(&(String.to_integer(&1)))
    length = Enum.sort(dimensions) |> Enum.take(2) |> Enum.map(&(2 * &1)) |> Enum.sum()
    volume = Enum.product(dimensions)
    length + volume
  end
end

# How can I pass a function to another, for example Wrapping.solve(content, Wrapping.paper)?

# Both stars
content
|> String.split()
|> Enum.map(&({Wrapping.paper(&1), Wrapping.ribbon(&1)}))
|> Enum.reduce(fn(item, acc) -> {elem(item, 0) + elem(acc, 0), elem(item, 1) + elem(acc, 1)} end)
|> IO.inspect()
