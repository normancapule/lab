defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck" do
    assert Enum.count(Cards.create_deck) == 20
  end

  test "shuffle" do
    deck = Cards.create_deck
    assert Cards.shuffle(deck) != deck
  end

  test "shuffle with non list argument" do
    assert Cards.shuffle(1) == []
  end

  test "contains?" do
    assert Cards.contains?(Cards.create_deck, "Ace of Spades")
    assert Cards.contains?(Cards.create_deck, "Hihi") == false
  end

  test "deal" do
    deck = Cards.create_deck
    { hand, deck } = Cards.deal(deck, 5)
    assert length(hand) == 5
    assert length(deck) == 15
  end
end
