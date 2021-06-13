class School
  attr_reader :enrollments

  def initialize
    @enrollments = Hash.new { |hash, key| hash[key] = [] }
  end

  def students(grade)
    enrollments[grade].sort
  end

  def add(name, grade)
    enrollments[grade] << name
  end

  def students_by_grade
    enrollments.sort.map do |grade, students|
      { grade: grade, students: students.sort }
    end
  end
end
