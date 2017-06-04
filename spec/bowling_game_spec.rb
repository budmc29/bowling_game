require 'spec_helper'

RSpec.describe BowlingGame do
	describe 'gem' do
		it 'has a version number' do
			expect(BowlingGame::VERSION).not_to be nil
		end
	end

	describe '#roll' do
		it 'can roll' do
			game = BowlingGame.new

			expect(game.roll(0)).to be_truthy
		end
	end

	describe 'scores a complete game' do
    before :each do
      subject { BowlingGame.new }
    end
    
		it 'of gutter balls' do
      roll_ball(20, 0)

			expect(subject.score).to eq(0)
		end

		it 'of ones' do
      roll_ball(20, 1)

			expect(subject.score).to eq(20)
		end

		it 'with one spare' do
      roll_spare

      subject.roll(3)

      roll_ball(17, 0)

			expect(subject.score).to eq(16)
		end

    it 'with a strike' do
      roll_strike

      subject.roll(3)
      subject.roll(4)

      roll_ball(16, 0)

      expect(subject.score).to eq(24);
    end

    it 'with a perfect game' do
      roll_ball(12, 10);

      expect(subject.score).to eq(300)
    end
	end

  private

  def roll_ball(number, value)
    number.times do
      subject.roll(value)
    end
  end

  def roll_spare
    subject.roll(5)
    subject.roll(5)
  end

  def roll_strike
    subject.roll(10)
  end
end
