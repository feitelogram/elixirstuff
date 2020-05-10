defmodule Cards do
  
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
        "#{card} of #{suit} "
    end
  
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck)
    File.write(file_name, binary)
  end

  def load(file_name) do
    {status, binary} = File.read(file_name)
    case status do
      :ok ->  :erlang.binary_to_term(binary)
      :error -> "That file does not exist"
    end
  end

end
