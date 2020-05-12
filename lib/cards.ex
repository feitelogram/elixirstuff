defmodule Cards do

@moduledoc """
Provides methods for creating and handling a deck of cards.
"""

@doc """
Returns a list of strings representing a deck of playing cards.
"""
  
  def create_deck do
    # values = [
    # "Fool", "Magician", "Priestess", "Empress", 
    # "Emperor", "Hierophant", "Lovers", "Chariot", 
    # "Justice", "Hermit", "Fortune", "Strength", "Hanged Man",
    # "Death", "Temperance", "Devil", "Tower", "Star",
    # "Moon", "Sun", "Judgement", "World"
    # ]

    # users = [
    #   "Igor", "Mona", "Makoto", "Haru", 
    #   "Yusuke", "Sojiro", "Ann", "Ryuji",
    #   "Akechi", "Futaba", "Chihaya", "Lavenza", "Iwai",
    #   "Takemi", "Kawakami", "Ohya", "Shinya", "Hifumi",
    #   "Mishima", "Toshida", "Sae", "Joker"
    # ]

    cards = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]

    for suit <- suits, card <- cards do
        "#{card} of #{suit}"
    end
  
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
Determines whether a deck contains a given card.

## Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Hearts")
      true

"""

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
Divides a deck into a hand and the remainder of the deck. The `hand_size`  argument
says how many arguments should be in the hand.

## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Hearts"]

"""

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    case File.read(file_name) do
      {:ok, binary} ->  :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end


end
