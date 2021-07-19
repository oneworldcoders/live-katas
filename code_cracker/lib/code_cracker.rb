class CodeCracker
  def initialize
    @alphabets = 'abcdefghijklmnopqrstuvwxyz'
    @keys = '!)"(£*%&><@abcdefghijklmno'
  end

  def encrypt(text)
    text = text.gsub(/\s+/, '')
    transfrom(text, @alphabets, @keys)
  end

  def decrypt(key)
    transfrom(key, @keys, @alphabets)
  end

  private

  def transfrom(input, input_mapping, output_mapping)

    output_array = input.split('').map do |value|
      index = input_mapping.index(value)
      output_mapping[index]
    end

    output_array.join('')
  end
end
