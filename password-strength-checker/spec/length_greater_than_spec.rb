require_relative '../lib/length_greater_than'
RSpec.describe LengthGreaterThan do
  it 'should have atleast 7 characters' do
    password_length_checker = LengthGreaterThan.new(7)
    expect(password_length_checker.validate?('psswrd')).to eq false
  end

  it 'returns true if password length is greater or equal to 7' do
    password_length_checker = LengthGreaterThan.new(7)
    expect(password_length_checker.validate?('password')).to eq true
  end
end
