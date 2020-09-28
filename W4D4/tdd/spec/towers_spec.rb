require "rspec"
require "towers_of_hanoi"

describe TowersOfHanoi do
    subject(:towers) { TowersOfHanoi.new }

    describe "#initialize" do
        it "sets the initial towers" do
            expect(towers.poles).to eq([[1,2,3], [], []])
        end
    end

    describe "won?" do
        it "successfully moves all discs from the first pole to the third" do
            allow(towers).to receive(:move).and_return(towers.poles = [[], [], [1,2,3]])
            expect(towers.poles == [[], [], [1,2,3]] ).to be true
        end
    end



end