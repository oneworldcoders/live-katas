# 1, 5, 10, 20, 40, 50,
# 1, 5, 10, 20, 40, 50, 75, 99
require 'rspec'
require 'coin_changer'

RSpec.describe Change do 
  let (:change) {Change.new}
  it "test if methjod is responsive" do
    expect(change.respond_to?(:money)).to eq(true)
  end

  describe "Get change for" do
    it "One shilling coin" do
      expect(change.money(1)).to eq([1])
    end

    it "Five shilling coin" do
      expect(change.money(5)).to eq([5])
    end

    it "Ten shilling coin" do
      expect(change.money(10)).to eq([10])
    end

    it "Twenty shilling coin" do
      expect(change.money(20)).to eq([20])
    end

    it "Fourty shilling coin" do
      expect(change.money(40)).to eq([20, 20])
    end

    it "Fifty shilling note" do
      expect(change.money(50)).to eq([50])
    end

    it "Seventy five shillings" do
      expect(change.money(75)).to eq([50, 20, 5])
    end

    it "Ninety nine shillings" do
      expect(change.money(99)).to eq([50, 20, 20, 5, 1, 1, 1 ,1])
    end
  end
end