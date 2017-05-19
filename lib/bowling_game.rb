require "bowling_game/version"

class BowlingGame
  attr_accessor :score_value

  def roll(pins)
    @score_value ||= 0
    @score_value += pins
  end

  def score
    @score_value
  end
end
