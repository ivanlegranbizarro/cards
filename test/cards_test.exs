defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck/0 returns a list of 52 cards" do
    assert length(Cards.create_deck()) == 52
  end

  test "shuffle/1 returns a shuffled deck" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
  end
end
