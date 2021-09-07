class PasswordStrengthChecker
  def initialize(rules)
    @rules = rules
  end

  def is_valid?(password)
    @rules.all? { |rule| rule.validate?(password) }
  end
end
