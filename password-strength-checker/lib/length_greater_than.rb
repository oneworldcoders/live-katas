class LengthGreaterThan
  def initialize(minimum_length)
    @minimum_length = minimum_length
  end

  def validate?(password)
    password.length >= @minimum_length
  end
end
