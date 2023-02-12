{_result, content} = File.read("./01_calories.txt")

values = content
  |> String.split("\n\n") # A list of strings
  |> Enum.map(&(String.split(&1, "\n"))) # A list of lists of strings
  |> Enum.map(&(Enum.map(&1, fn(s) -> String.to_integer(s) end))) # A list of lists of integers
  |> Enum.map(&(Enum.sum(&1))) # A list of integers

# Replace with Enum.chunk_by()?
# values = content
#   |> String.split("\n")
#   |> Enum.chunk_by(&(&1 != "")) # Issue with empty strings
#   |> Enum.map(&(Enum.map(&1, fn(s) -> String.to_integer(s) end)))
#   |> Enum.map(&(Enum.sum(&1))) # A list of integers

# First star
values |> Enum.max() |> IO.puts()

# Second star
values |> Enum.sort(:desc) |> Enum.take(3) |> Enum.sum() |> IO.puts()
