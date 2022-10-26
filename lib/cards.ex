defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards.
  """

  @doc """
  Return a list of strings representing a deck of cards.

  ## Examples

      iex> Cards.create_deck()
      ["A♠", "2♠", "3♠", "4♠", "5♠", "6♠", "7♠", "8♠", "9♠",
      "10♠", "J♠", "Q♠", "K♠", "A♥", "2♥", "3♥", "4♥", "5♥",
      "6♥", "7♥", "8♥", "9♥", "10♥", "J♥", "Q♥", "K♥", "A♦",
      "2♦", "3♦", "4♦", "5♦", "6♦", "7♦", "8♦", "9♦", "10♦",
      "J♦", "Q♦", "K♦", "A♣", "2♣", "3♣", "4♣", "5♣", "6♣",
      "7♣","8♣", "9♣", "10♣", "J♣", "Q♣", "K♣"]
  """
  def create_deck do
    values = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    suits = ["♠", "♥", "♦", "♣"]

    for suite <- suits, value <- values, do: "#{value}#{suite}"
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Determine wether a deck contains a given card

  ## Examples

      iex> Cards.contains?(["A♠", "2♠", "3♠"], "A♠")
      true

      iex> Cards.contains?(["A♠", "2♠", "3♠"], "A♥")
      false
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
  Divides a deck into remaining deck and a hand.
  The `hand_size` parameter is the number of cards in each hand.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> {hand, _deck} = Cards.deal(deck, 5)
      iex> hand
      ["A♠", "2♠", "3♠", "4♠", "5♠"]
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "File not found"
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
  end
end
