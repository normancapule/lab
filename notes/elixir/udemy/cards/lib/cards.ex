defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle(deck) when is_list(deck), do: Enum.shuffle(deck)

  def shuffle(_), do: []
end
