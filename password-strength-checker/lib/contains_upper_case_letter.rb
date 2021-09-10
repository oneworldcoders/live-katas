class ContainsUpperCaseLetter
  def validate?(password)
    !password.match(/[[:upper:]]/).nil?
  end
end