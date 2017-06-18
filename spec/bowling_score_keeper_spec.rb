require 'spec_helper'

RSpec.describe BowlingScoreKeeper do
  describe 'gem' do
    it 'has a version number' do
      expect(BowlingScoreKeeper::VERSION).not_to be nil
    end
  end

  describe '#roll' do
    it 'can roll' do
      game = BowlingScoreKeeper.new

      expect(game.roll(0)).to be_truthy
    end

    it 'requires an integer' do
      game = BowlingScoreKeeper.new

      game.roll('0')

      expect(game.score).to be_truthy
    end
  end

  describe 'with an incomplete game' do
    it "doesn't score it" do
      subject { BowlingScoreKeeper.new }

      subject.roll(10)

      expect(subject.score).to eq "incomplete"
    end
  end

  describe 'scores a complete game' do
    before :each do
      subject { BowlingScoreKeeper.new }
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
