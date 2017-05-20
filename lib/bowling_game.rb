require "bowling_game/version"

class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    @rolls.inject(0){ |s, e| s + e }
  end
end
