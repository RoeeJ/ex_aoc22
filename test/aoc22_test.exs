defmodule Aoc22Test do
  use ExUnit.Case
  doctest Aoc22
  doctest Aoc22.Day1
  doctest Aoc22.Day2

  test "day1" do
    elves =
      File.read!("inputs/day1.txt")
      |> Aoc22.Day1.process()

    highest_elf = Enum.max(elves)
    assert highest_elf == 66719
    top_three = Enum.take(elves, 3) |> Enum.sum()
    assert top_three == 198_551
  end

  test "day2" do
    matches =
      File.read!("inputs/day2.txt")
      |> Aoc22.Day2.process(:part1)

    assert Enum.sum(matches) == 9241
  end
end
