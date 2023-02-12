{_result, content} = File.read("./01_captcha.txt")

content = String.split(content, "", trim: true) |> Enum.map(&(String.to_integer(&1)))

# First star

sum = content
|> Enum.with_index()
|> Enum.filter(fn({c, i}) -> c == Enum.at(content, i + 1) end)
|> Enum.map(fn({a, _b}) -> a end)
|> Enum.sum()

if hd(content) == List.last(content) do
  IO.puts sum + hd(content)
else
  IO.puts sum
end

# Second star

content
|> Enum.chunk_every(div(length(content), 2))
|> Enum.zip()
|> Enum.filter(fn({a, b}) -> a == b end)
|> Enum.reduce(0, fn(item, acc) -> acc + elem(item, 0) * 2 end)
# |> Enum.map(fn({a, b}) -> a + b end)
# |> Enum.sum()
|> IO.puts
