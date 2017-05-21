require "bowling_game/version"
require "pry"

class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
		@rolls << 0 if strike?(pins)
		@rolls
  end

  def score
    score = 0

    @rolls.each_slice(2).with_index do |roll, i|
			first_roll = roll[0]
			second_roll = roll[1]

			if(strike?(first_roll))
				score += 10 + @rolls[i + 2] + @rolls[i + 3]
      elsif(spare?(first_roll, second_roll))
        score += 10 + @rolls[i + 2]
      else
				score += first_roll + second_roll
      end
    end

    score
  end

	private

	def spare?(first_roll, second_roll)
		(first_roll + second_roll) == 10
	end

	def strike?(first_roll)
		first_roll == 10
	end
end
