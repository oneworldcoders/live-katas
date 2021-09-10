require_relative '../lib/contains_lower_case_letter'

describe ContainsLowerCaseLetter do
  let(:contains_lower_case_letter) { ContainsLowerCaseLetter.new }

  it 'should have atleast 1 lower case character' do
    expect(contains_lower_case_letter.validate?('PWWWW')).to eq false
  end

  it 'returns true if it contains a lower case letter' do
    expect(contains_lower_case_letter.validate?('pasword')).to eq true
  end
end
