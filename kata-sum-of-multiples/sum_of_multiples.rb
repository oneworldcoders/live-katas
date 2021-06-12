class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples
  end
  def to(limit)
    (1...limit).inject(0) do |sum, range|
      if(@multiples.any?{|multiple| range % multiple == 0})
        sum + range
      else
        sum
      end
    end
    
  end
end