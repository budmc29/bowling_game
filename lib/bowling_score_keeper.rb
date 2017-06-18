require 'bowling_score_keeper/version'
require 'pry'

class BowlingScoreKeeper
  attr_accessor :name
  MAX_ROLL_POINTS = 10

  def initialize
    @rolls = []
  end

  def call
    set_name

    track_score
  end

  def roll(pins)
    puts "You knocked #{pins} pins."
    @rolls << pins.to_i
  end

  def score
    begin
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
    rescue
      'incomplete'
    end
  end

  private

  def print_score
    puts "Your score is #{score}"
  end

  def set_name
    @name = ''
    while @name.empty?
      puts 'What is your name'
      @name = gets.chomp
    end
  end

  def track_score
    @value = ''
    while @value.empty?
      puts 'Enter knocked pins:'
      puts 'Type score to see your score, or exit to end the game.'
      @value = gets.chomp

      case @value
      when 'score'
        print_score
      when 'exit'
        print "Congratulation #{@name},"
        puts "You finished the game with a score of: #{score}"
        exit
      else
        roll(@value)
      end

      @value = ''
    end
  end

  def spare?(first_in_frame)
    (@rolls[first_in_frame] + @rolls[first_in_frame + 1]) ==
      MAX_ROLL_POINTS
  end

  def strike?(first_in_frame)
    @rolls[first_in_frame] == MAX_ROLL_POINTS
  end
end
