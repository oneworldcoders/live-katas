require 'rspec'
require_relative '../lib/string_calculator'

describe StringCalculator do
  subject(:string_calculator) { StringCalculator.new }
  it 'takes an empty string and returns 0' do
    expect(string_calculator.add('')).to eq(0)
  end
  it 'takes 1 number within string' do
    expect(string_calculator.add('1')).to eq(1)
  end
  it 'takes 2 numbers within string' do
    expect(string_calculator.add('1,2')).to eq(3)
  end
  it 'takes unkown numbers within string' do
    expect(string_calculator.add('1,2,3,4,5')).to eq(15)
  end
  it 'handles new line with string ex 1\n2,3' do
    expect(string_calculator.add("1\n2,3")).to eq(6)
  end
  it 'throws error "negatives not allowed" when negatives are given' do
    expect { string_calculator.add('1,-2') }.to raise_error(RuntimeError, 'negatives not allowed')
  end
  it 'ignores numbers equal to 1000 and above' do
    expect(string_calculator.add('1000,4')).to eq(4)
  end
  it 'handles any length of delimiters' do
    expect(string_calculator.add("//[%%%]\n1%%%2%%%3")).to eq(6)
  end
end
