class StringCalculator
  NEGATIVE_ERROR_MESSAGE = 'negatives not allowed'
  def add(string)
    numbers = split_string string
    if contains_delimiters? numbers
      delimiters = delimiter numbers
      numbers = remove_delimiters numbers, delimiters
    end
    raise NEGATIVE_ERROR_MESSAGE if contains_negative? numbers

    digits = convert_string_to_integers numbers
    digits = removes_numbers_equal_to_1000_and_above digits
    is_nil?(digits) ? 0 : digits.reduce(:+)
  end

  private

  def split_string(string)
    string.split(/[\n,]/)
  end

  def convert_string_to_integers(string)
    string.map(&:to_i)
  end

  def is_nil?(string)
    string.first.nil?
  end

  def contains_negative?(string)
    string.any? { |digit| digit.include?('-') }
  end

  def removes_numbers_equal_to_1000_and_above(numbers)
    numbers.map { |number| number = number >= 1000 ? 0 : number }
  end

  def contains_delimiters?(string)
    string.any? { |digit| digit.include?('//') }
  end

  def delimiter(numbers)
    numbers.first.delete('//[]')
  end

  def remove_delimiters(numbers, delimiter)
    numbers.last.delete(delimiter).split('')
  end
end
