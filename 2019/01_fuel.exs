{_result, content} = File.read("./01_fuel.txt")

defmodule Fuel do
  def calc(mass), do: div(mass, 3) - 2

  def calc_rec(mass) do
    if is_list(mass) do
      if hd(mass) <= 0 do
        tl(mass) |> Enum.sum()
      else
        calc_rec([calc(hd(mass)) | mass])
      end
    else
      calc_rec([calc(mass)])
    end
  end
end

# First star
content
|> String.split()
|> Enum.map(&(String.to_integer(&1)))
|> Enum.map(&(Fuel.calc(&1)))
|> Enum.sum()
|> IO.puts

# Second star
content
|> String.split()
|> Enum.map(&(String.to_integer(&1)))
|> Enum.map(&(Fuel.calc_rec(&1)))
|> Enum.sum()
|> IO.puts
