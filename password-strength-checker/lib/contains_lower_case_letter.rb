class ContainsLowerCaseLetter
  def validate?(password)
    !password.match(/[[:lower:]]/).nil?
  end
end