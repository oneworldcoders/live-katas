class PasswordStrengthChecker
  def initialize(rules)
    @rules = rules
  end

  def is_valid?(password)
    valid = true
    @rules.each do |rule|
      valid = false unless rule.validate?(password)
    end
    valid
  end
end


