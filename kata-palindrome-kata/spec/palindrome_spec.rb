require 'rspec'
require 'palindrome'
# bob, Bob, ABBA,taco cat ,A MAN, A PLAN, canal, panama

RSpec.describe Palindromes do
  it 'gets the palindrome of bob' do
    palindrome = Palindromes.new
    expect(palindrome.string?('bob')).to eq(true)
  end

  it 'gets the palindrome of bob' do
    palindrome = Palindromes.new
    expect(palindrome.string?('Bob')).to eq(true)
  end

  it 'gets the palindrome of bob' do
    palindrome = Palindromes.new
    expect(palindrome.string?('ABBA')).to eq(true)
  end

  it 'gets the palindrome of bob' do
    palindrome = Palindromes.new
    expect(palindrome.string?('taco cat')).to eq(true)
  end

  it 'gets the palindrome of bob' do
    palindrome = Palindromes.new
    expect(palindrome.string?('A MAN')).to eq(false)
  end

  it 'gets the palindrome of bob' do
    palindrome = Palindromes.new
    expect(palindrome.substring?('A MAN')).to eq(true)
  end

  it 'gets the palindrome of bob' do
    palindrome = Palindromes.new
    expect(palindrome.substring?('A PLAN')).to eq(false)
  end

  it 'gets the palindrome of bob' do
    palindrome = Palindromes.new
    expect(palindrome.substring?('canal')).to eq(true)
  end

  it 'gets the palindrome of bob' do
    palindrome = Palindromes.new
    expect(palindrome.substring?('panama')).to eq(true)
  end
end
