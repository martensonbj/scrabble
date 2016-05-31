require_relative './scrabble'

class Player
  attr_accessor :total, :scrabble, :words

  def initialize
    @scrabble = Scrabble.new
    @words = []
  end

  def total
    @words.reduce(0) do |sum, word|
      sum += scrabble.score(word)
    end
  end

  def play(word)
    add_word(word)
    score = scrabble.score(word)
  end

  def add_word(word)
    @words << word
  end

  def won?
    true if @total >= 25
  end

  def tile_count
    @words.map do |word|
      word.chars.count
    end.reduce(:+)
  end

  def tiles
    chars = @words.map do |word|
      word.upcase.chars
    end

    counts = Hash.new 0
    chars.flatten.each do |letter|
      counts[letter] += 1
    end
    binding.pry
  end
end
