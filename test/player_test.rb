gem 'minitest'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test

  def test_it_can_total_score
    player = Player.new
    assert_equal 8, player.play('hello')
  end

  def test_it_can_play_multiple_words
    player = Player.new
    player.play('hello')
    assert_equal 8, player.play('hello')
    assert_equal 16, player.total
    assert_equal ['hello', 'hello'], player.words
    assert_equal 10, player.tile_count
    assert_equal 10, player.tiles
  end

end
