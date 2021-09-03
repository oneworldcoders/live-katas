class ContainsADigit
  def validate?(password)
    !password.match(/[[:digit:]]/).nil?
  end
end