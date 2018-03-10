defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of playing cards.
  """

  def create_deck() do
    suits = ["diamonds", "clubs", "spades", "hearts"]

    ranks = [
      "ace",
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine",
      "ten",
      "jack",
      "queen",
      "king"
    ]

    for suit <- suits,
        rank <- ranks do
      {rank, suit}
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Checks to see if a given card is in the given deck.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.has_card?(deck, {"ace", "spades"})
      true

  """
  def has_card?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  @doc """
    Gets an amount of cards as specified by `hand_size` from a shuffled deck
    of cards.
  """
  def create_hand(hand_size) do
    {hand, _rest_of_deck} =
      create_deck()
      |> shuffle
      |> deal(hand_size)

    hand
  end

  def save(deck_to_save, saved_file_name) do
    binary = :erlang.term_to_binary(deck_to_save)
    File.write(saved_file_name, binary)
  end

  def load_deck_from_file(file_name_to_load) do
    case File.read(file_name_to_load) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _error_message} -> "That file does not exist!"
    end
  end

  def display_deck(deck) do
    for card <- deck do
      {rank, suit} = card
      "#{rank} of #{suit}"
    end
  end

  def main do
    new_hand = create_hand(5)

    save(new_hand, 'new-hand')
    load_deck_from_file('new-hand')

    display_deck(new_hand)
  end
end
