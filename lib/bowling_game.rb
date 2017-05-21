require "bowling_game/version"
require "pry"

class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    score = 0

    @rolls.each_slice(2).with_index do |roll, i|
      if(spare?(roll))
        score += 10 + @rolls[i + 2]
      else
        score += roll[0] + roll[1]
      end
    end

    score
  end

	private

	def spare?(roll)
		(roll[0] + roll[1]) == 10
	end
end
