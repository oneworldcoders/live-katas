require_relative '../lib/contains_a_digit'

describe ContainsADigit do
  let(:contains_a_digit) { ContainsADigit.new }

  it "returns false if password doesn't have a digit" do
    expect(contains_a_digit.validate?('Password')).to eq false
  end

  it 'returns true if password contains a digit' do
    expect(contains_a_digit.validate?('Password1')).to eq true
  end
end
