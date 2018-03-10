defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "should create a deck of 52 cards" do
    deck_of_cards = Cards.create_deck()
    amount_of_cards = length(deck_of_cards)

    assert amount_of_cards == 52
  end

  test "should shuffle a deck of cards" do
    original_deck = Cards.create_deck()
    shuffled_deck = Cards.shuffle(original_deck)

    assert length(shuffled_deck) == 52
    refute shuffled_deck == original_deck
  end
end
