defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create deck makes 20 cards" do
    assert length(Cards.create_deck()) == 20
  end

  test "shuffle randomizes deck" do
    deck = Cards.create_deck()
    refute deck == Cards.shuffle(deck)
  end
end
