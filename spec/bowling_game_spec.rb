require "spec_helper"

RSpec.describe BowlingGame do
	describe 'gem' do
		it "has a version number" do
			expect(BowlingGame::VERSION).not_to be nil
		end
	end

	describe '#roll' do
		it "can roll" do
			game = BowlingGame.new

			expect(game.roll(0)).to be_truthy
		end
	end

	describe 'scores a complete game' do
		it 'of gutter balls' do
			game = BowlingGame.new

      roll_ball(20, 0, game)

			expect(game.score).to eq(0)
		end

		it 'of ones' do
			game = BowlingGame.new

      roll_ball(20, 1, game)

			expect(game.score).to eq(20)
		end

		it 'with one spare' do
			game = BowlingGame.new

			game.roll(5)
			game.roll(5) # Spare
			game.roll(3)

      roll_ball(17, 0, game)

			expect(game.score).to eq(16)
		end
	end

  private

  def roll_ball(number, value, game)
    number.times do
      game.roll(value)
    end
  end
end
