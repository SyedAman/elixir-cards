defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

  """

  def create_deck() do
    suits = ["diamonds", "clubs", "spades", "hearts"]
    ranks = ["ace", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king"]

    for suit <- suits, rank <- ranks do
      { rank, suit }
    end
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end

  def checkIfDeckHasCard?(deck, card) do
    Enum.member?(deck, card)
  end

  def main do
    newDeck = create_deck()
    # shuffledDeck = shuffle_deck(newDeck)

    # checkIfDeckHasCard?(shuffledDeck, "ace")
  end
end
