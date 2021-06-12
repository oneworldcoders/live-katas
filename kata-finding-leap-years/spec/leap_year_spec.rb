# 2000, 2200, 2008, 2010, 1200, 1900, 1700, 1600, 2020, 2018, 2001
require 'leap_year'

RSpec.describe Year do
  context 'trying to find leap years' do
    it 'check if 2000 wass a leap year' do
      year = Year.new
      expect(year.leap?(2000)).to eq(true)
    end

    it 'check if 2200 wass a leap year' do
      year = Year.new
      expect(year.leap?(2200)).to eq(false)
    end

    it 'check if 2008 wass a leap year' do
      year = Year.new
      expect(year.leap?(2008)).to eq(true)
    end

    it 'check if 2001 wass a leap year' do
      year = Year.new
      expect(year.leap?(2001)).to eq(false)
    end

    it 'check if 1900 wass a leap year' do
      year = Year.new
      expect(year.leap?(1900)).to eq(false)
    end

    it 'check if 1200 wass a leap year' do
      year = Year.new
      expect(year.leap?(1200)).to eq(true)
    end

    it 'check if 1700 wass a leap year' do
      year = Year.new
      expect(year.leap?(1700)).to eq(false)
    end

    it 'check if 1600 wass a leap year' do
      year = Year.new
      expect(year.leap?(1600)).to eq(true)
    end
  end
end
