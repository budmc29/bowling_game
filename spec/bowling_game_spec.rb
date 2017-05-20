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

			20.times do
				game.roll(0)
			end

			expect(game.score).to eq(0)
		end

		it 'of ones' do
			game = BowlingGame.new

			20.times do
				game.roll(1)
			end

			expect(game.score).to eq(20)
		end
	end
end
