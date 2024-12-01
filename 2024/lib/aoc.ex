defmodule Aoc do
  @spec read_puzzle(day :: integer) :: [String.t()]
  def read_puzzle(day) do
    {:ok, content} = File.read("outputs/day#{day}.txt")

    content |> String.split("\n", trim: true)
  end
end
