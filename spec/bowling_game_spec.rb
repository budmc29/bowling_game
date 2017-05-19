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

			expect(game.roll(0)).to eq(0)
		end
	end

	describe 'complete game' do
		it 'scores a gutter game' do
			game = BowlingGame.new

			10.times do
				game.roll(0)
			end

			expect(game.score).to eq(0)
		end
	end
end
