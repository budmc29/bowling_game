require 'bowling_game/version'
require 'pry'

class BowlingGame
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    score = 0

    first_in_frame = 0
    for frame in 0...10
			if(strike?(first_in_frame))
				score += 10 + @rolls[first_in_frame + 1] + @rolls[first_in_frame + 2]
        first_in_frame += 1
      elsif(spare?(first_in_frame))
        score += 10 + @rolls[first_in_frame + 2]
        first_in_frame += 2
      else
				score += @rolls[first_in_frame] + @rolls[first_in_frame + 1]
        first_in_frame += 2
      end
    end

    score
  end

	private

	def spare?(first_in_frame)
		(@rolls[first_in_frame] + @rolls[first_in_frame + 1]) == 10
	end

	def strike?(first_in_frame)
		@rolls[first_in_frame] == 10
	end
end
