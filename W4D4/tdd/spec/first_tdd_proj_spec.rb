require "rspec"
require "first_tdd_project"

describe "my_uniq" do
    subject(:array) {[1, 2, 1, 3, 3]}
    let(:uniq) {my_uniq(array)}

    it "removes duplicates" do
        uniq.each do |num|
            expect(uniq.count(num)).to eq(1)
        end
    end

    it "doesn't mutate the original array" do
        expect(uniq).to_not be(array)
    end
end

describe "two_sum" do
#     # subject(:array) { [-1, 0, 2, -2, 1, 1] } # [[0,4] ,[0,5], [2,3]]
    it "returns positions of pairs of numbers that add to zero" do
        expect(two_sum([5, 1, -7, -5])).to eq([[0, 3]])
    end

    it "finds multiple pairs" do
        expect(two_sum([5, -1, -5, 1])).to eq([[0, 2], [1, 3]])
    end

    it "finds pairs with same element" do
        expect(two_sum([5, -5, -5])).to eq([[0, 1], [0, 2]])
    end

    it "returns [] when no pair is found" do
        expect(two_sum([5, 5, 3, 1])).to eq([])
    end
end

describe "my_transpose" do
    subject(:matrix) {[
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
    ]}

    it "transposes the matrix" do
        expect(my_transpose(matrix)).to eq(
            [[0, 3, 6],
            [1, 4, 7],
            [2, 5, 8]])
    end
end

describe "pick_stocks" do
    
    it "returns a pair of indices" do
        expect(pick_stocks([1, 45, 5, 8, 9])).to eq([0,1])
    end

    it "finds the best pair of days" do
        expect(pick_stocks([46, 45, 5, 8, 9, 100])).to eq([2,5])
    end
end
