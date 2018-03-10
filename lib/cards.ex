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

  def create_deck(deck) do
    deck
  end

  def shuffle_deck(deck) do
    Enum.shuffle(deck)
  end

  def main do
    newDeck = create_deck(["ace", "queen", "jack", "two"])
    shuffle_deck(newDeck)
  end
end
