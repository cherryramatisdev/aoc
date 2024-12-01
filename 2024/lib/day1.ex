defmodule Aoc.Day1 do
  def part1 do
    get_pairs()
    |> Enum.reduce({[], []}, fn [x, y], {first, second} ->
      {Enum.sort([x | first], :asc), Enum.sort([y | second], :asc)}
    end)
    |> then(fn {x, y} -> Enum.zip(x, y) end)
    |> Enum.map(fn {x, y} -> abs(x - y) end)
    |> Enum.sum()
  end

  def part2 do
    get_pairs()
    |> Enum.map(fn [x, _] ->
      x * (get_pairs() |> Enum.count(fn [_, y] -> x == y end))
    end)
    |> Enum.sum()
  end

  defp get_pairs() do
    Aoc.read_puzzle(1)
    |> Enum.map(fn x -> String.split(x, " ", trim: true) |> Enum.map(&String.to_integer/1) end)
  end
end
