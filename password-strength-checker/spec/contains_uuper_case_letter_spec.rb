require_relative '../lib/contains_upper_case_letter'
RSpec.describe ContainsUpperCaseLetter do
  let(:contains_upper_case_letter) { ContainsUpperCaseLetter.new }
  
  it 'should have atleast 1 upper case character' do
    expect(contains_upper_case_letter.validate?('password')).to eq false
  end

  it 'returns true if password contains upper case letter' do
    expect(contains_upper_case_letter.validate?('Password')).to eq true
  end
end
