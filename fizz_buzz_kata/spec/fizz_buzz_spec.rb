require 'rubygems'
require 'rspec'
require_relative '../lib/fizz_buzz'

describe FizzBuzz do
  [
    [1, 1],
    [2, 2], 
    [3, 'fizz'],
    [5, 'buzz'],
    [6, 'fizz'],
    [10, 'buzz'],
    [13, 'fizz'],
    [15, 'fizzbuzz'],
    [30, 'fizzbuzz']
  ].each do |input_value, return_value|
    it "Returns #{return_value} when #{input_value} is provided" do
      fizz_buzz = FizzBuzz.new
     expect(fizz_buzz.fizz_buzz_checker(input_value)).to eq(return_value)
    end 
  end

  it 'Returns 1 to 15 if 15 is provided' do
    fizz_buzz = FizzBuzz.new
    return_data = [1, 2, 'fizz', 4, 'buzz', 'fizz', 7, 8, 'fizz', 'buzz', 11, 'fizz', 'fizz', 14, 'fizzbuzz']
    expect(fizz_buzz.fizz_buzz_iterator(15)).to eq(return_data)
  end
end
