require 'bowling_score_keeper/version'

class BowlingScoreKeeper
  MAX_ROLL_POINTS = 10

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    return score_for_too_few_rolls if too_few_rolls

    score = 0
    first_in_frame = 0

    10.times do
      if(strike?(first_in_frame))
        score += MAX_ROLL_POINTS +
          @rolls[first_in_frame + 1] +
          @rolls[first_in_frame + 2]
        first_in_frame += 1
      elsif(spare?(first_in_frame))
        score += MAX_ROLL_POINTS + @rolls[first_in_frame + 2]
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
    (@rolls[first_in_frame] + @rolls[first_in_frame + 1]) ==
      MAX_ROLL_POINTS
  end

  def strike?(first_in_frame)
    @rolls[first_in_frame] == MAX_ROLL_POINTS
  end

  def too_few_rolls
    @rolls.size <= 3
  end

  def score_for_too_few_rolls
    @rolls.inject(0) { |s, e| s + e }
  end
end
