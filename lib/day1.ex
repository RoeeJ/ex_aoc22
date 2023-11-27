defmodule Aoc22.Day1 do
  @doc """

  ## Examples
    iex>  elves = File.read!("inputs/day1_demo.txt")
    iex>  |> Aoc22.Day1.process()
    iex>  Enum.max(elves)
    24000 
    iex>  top_three = Enum.take(elves, 3) |> Enum.sum()
    iex>  top_three 
    45000 

  """
  @spec process(String.t()) :: list(integer())
  def process(input) do
    input
    |> String.trim()
    |> String.split("\n\n")
    |> Enum.map(&parse_elf/1)
    |> Enum.sort()
    |> Enum.reverse()
  end

  def parse_elf(elf) when is_binary(elf) do
    parse_elf(String.split(elf, "\n")) |> Enum.sum()
  end

  def parse_elf(elf) when is_list(elf), do: Enum.map(elf, &String.to_integer/1)
end
