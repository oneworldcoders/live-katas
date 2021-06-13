class RunLength
  def initialize(str)
      @str = str
  end

  def encode
      encode_r(@str[0], @str[1, @str.length - 1])
  end

  def encode_r(first, rest, count=0)
      unless rest
          count += 1 if first
          return segment(count, first)
      end
      new_first, rest = rest[0], rest[1, rest.length - 1]
      count += 1
      if first == new_first
          encode_r(new_first, rest, count)
      else
          "#{segment(count, first)}#{encode_r(new_first, rest)}"
      end
  end

  def segment(count, character)
      [0, 1].include?(count) ? character || '' : "#{count}#{character}"
  end

  def decode
      decode_r(@str[0], @str[1, @str.length - 1])
  end

  def decode_r(first, rest, prev=nil)
      return '' unless rest

      if is_number?(first)
          "#{first * (prev.to_i == 0 ? 1 : prev.to_i)}#{decode_r(rest[0], rest[1, rest.length-1])}"
      else
          decode_r(rest[0], rest[1, rest.length-1], (prev || '') + first)
      end
  end

  def is_number?(str)
      str.to_i == 0
  end
end