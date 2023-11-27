defmodule Aoc22.Day2 do
  alias Aoc22.Day2.Aoc22.Day2.Match

  defmodule Aoc22.Day2.Match do
    defstruct me: nil, opp: nil
  end

  @actions %{
    "A" => :rock,
    "B" => :paper,
    "C" => :scissors,
    "X" => :rock,
    "Y" => :paper,
    "Z" => :scissors
  }
  @doc """
  ## Examples
  iex> input = File.read!("inputs/day2_demo.txt")
  iex> Aoc22.Day2.process(input, :part1) |> Enum.sum
  15
  """
  def process(input, :part1) do
    input
    |> String.trim()
    |> parse_matches
    |> Enum.map(&score_match/1)
  end

  def process(input, :part2) do
    input
    |> String.trim()
    |> parse_matches
    |> Enum.map(&score_match/1)
  end

  defp parse_matches(input), do: String.split(input, "\n") |> Enum.map(&parse_match(&1, :part1))

  defp parse_match(match, :part1) do
    [opp, me] = String.split(match, " ") |> Enum.map(&conv_action/1)
    %Match{me: me, opp: opp}
  end

  defp parse_match(_match, :part2) do
  end

  defp conv_action(act), do: @actions[act]

  defp score_match(%Match{me: me, opp: opp}) do
    score =
      case {me, opp} do
        x when x in [{:rock, :paper}, {:paper, :scissors}, {:scissors, :rock}] -> 0
        x when x in [{:paper, :rock}, {:scissors, :paper}, {:rock, :scissors}] -> 6
        _ -> 3
      end

    score + score_action(me)
  end

  defp score_action(action) do
    case action do
      :rock -> 1
      :paper -> 2
      :scissors -> 3
    end
  end
end
