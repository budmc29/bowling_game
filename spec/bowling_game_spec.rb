require "spec_helper"

RSpec.describe BowlingGame do
  it "has a version number" do
    expect(BowlingGame::VERSION).not_to be nil
  end

  it "works" do
		subject = BowlingGame.new.run
    expect(subject).to eq('It works')
  end
end
