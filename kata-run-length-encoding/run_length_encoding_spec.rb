require 'rspec/autorun'
require_relative 'run_length'

describe RunLength do
    it "encodes empty string" do
        rle = RunLength.new('')
        expect(rle.encode).to be_empty
    end

    it "encodes 1 character" do
        rle = RunLength.new('A')
        expect(rle.encode).to eq('A')
    end

    it "encodes 1 of all characters" do
        rle = RunLength.new('ABCDEFGHIJKLMNOPQRSTUVWXYZ')
        expect(rle.encode).to eq('ABCDEFGHIJKLMNOPQRSTUVWXYZ')
    end

    it "encodes multiple of the same character" do
        rle = RunLength.new('AAA')
        expect(rle.encode).to eq('3A')
    end

    it "encodes multiple different characters" do
        rle = RunLength.new('AAABBBB')
        expect(rle.encode).to eq('3A4B')
    end

    it "encodes for 1s in the middle of the string" do
        rle = RunLength.new('AAACBBBB')
        expect(rle.encode).to eq('3AC4B')
    end

    it "encodes for strings with 10 or more of the same character" do
        rle = RunLength.new('AAAAAAAAAA')
        expect(rle.encode).to eq('10A')
    end

    it "encodes for strings with 10+ of the same character in the middle" do
        rle = RunLength.new('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB')
        expect(rle.encode).to eq('12WB12W3B24WB')
    end

    it "decodes one empty string" do
        rle = RunLength.new('')
        expect(rle.decode).to be_empty
    end

    it "decodes one characters" do
        rle = RunLength.new('A')
        expect(rle.decode).to eq('A')
    end

    it "decodes multiple different characters" do
        rle = RunLength.new('3A')
        expect(rle.decode).to eq('AAA')
    end

    it "decodes multiple different characters" do
        rle = RunLength.new('3A4B')
        expect(rle.decode).to eq('AAABBBB')
    end

    it "decodes for 1s in the middle of the string" do
        rle = RunLength.new('3AC4B')
        expect(rle.decode).to eq('AAACBBBB')
    end

    it "decodes for strings with 10+ of the same character in the middle" do
        rle = RunLength.new('12WB12W3B24WB')
        expect(rle.decode).to eq('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB')
    end
end