require_relative '../lib/password_strength_checker'
require_relative '../lib/length_greater_than'

RSpec.describe PasswordStrengthChecker do
  let(:length_greater_than_six) { LengthGreaterThan.new(7) }
  let(:contains_upper_case_letter) { ContainsUpperCaseLetter.new }
  let(:contains_lower_case_letter) { ContainsLowerCaseLetter.new }
  let(:contains_a_digit) { ContainsADigit.new }

  let(:password_strength_checker) do
  end

  it 'should have atleast 1 lower case and 1 upper case letter' do
    password_strength_checker = PasswordStrengthChecker.new([contains_upper_case_letter, contains_lower_case_letter])
    expect(password_strength_checker.is_valid?('passrD')).to eq true
  end

  it 'should have atleast 1 lower, 1 upper, 1 digit and length greater than 10' do
    password_strength_checker = PasswordStrengthChecker.new([length_greater_than_six, contains_upper_case_letter, contains_lower_case_letter,
                                                             contains_a_digit])
    expect(password_strength_checker.is_valid?('Password')).to eq false
  end
end
