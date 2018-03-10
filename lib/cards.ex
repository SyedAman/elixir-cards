defmodule Cards do
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

  def checkIfDeckHasCard?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def create_hand(hand_size) do
    {hand, _rest_of_deck} =
      create_deck
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
      {:error, error_message} -> "That file does not exist!"
    end
  end

  def main do
    new_hand = create_hand(5)

    save(new_hand, 'new-hand')
    load_deck_from_file('new-hand')
  end
end
