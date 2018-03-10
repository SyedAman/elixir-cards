defmodule Cards do
  def create_deck() do
    suits = ["diamonds", "clubs", "spades", "hearts"]
    ranks = ["ace", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "jack", "queen", "king"]

    for suit <- suits, rank <- ranks do
      { rank, suit }
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def checkIfDeckHasCard?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck_to_save, saved_file_name) do
    binary = :erlang.term_to_binary(deck_to_save)
    File.write(saved_file_name, binary)
  end

  def load_deck_from_file(file_name_to_load) do
    { status, binary } = File.read(file_name_to_load)
    :erlang.binary_to_term(binary)
  end

  def main do
    shuffledDeck = shuffle(create_deck())

    { first_hand, rest_of_deck } = deal(shuffledDeck, 5)
    { second_hand, rest_of_deck } = deal(rest_of_deck, 5)

    save(first_hand, 'first-hand')
    load_deck_from_file('first-hand')
  end
end
