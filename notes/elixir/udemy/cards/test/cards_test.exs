defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck" do
    assert Cards.create_deck == ["Ace", "Two", "Three"]
  end

  test "shuffle" do
    deck = Cards.create_deck
    assert Cards.shuffle(deck) != deck
  end

  test "shuffle with non list argument" do
    assert Cards.shuffle(1) == []
  end
end
