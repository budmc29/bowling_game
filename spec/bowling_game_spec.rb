require "spec_helper"

RSpec.describe BowlingGame do
	describe 'gem' do
		it "has a version number" do
			expect(BowlingGame::VERSION).not_to be nil
		end
	end

	describe '#roll' do
		before :each do
			@game = BowlingGame.new
		end

		it "works" do
			expect(@game.run).to eq('It works')
		end

		it "can roll" do
			expect(@game.roll(0)).to eq(0)
		end
	end
end
