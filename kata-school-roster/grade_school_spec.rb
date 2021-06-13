require "rspec/autorun"
require_relative "grade_school.rb"

RSpec.describe School do
  context "students" do
    it "test_empty_grade" do
      expected_result = []
      expect(subject.students(1)).to eq(expected_result)
    end

    it "test_add_student" do
      subject.add("Julius", 2)
      expected_result = ["Julius"]
      expect(subject.students(2)).to eq(expected_result)
    end

    it "test_add_students_to_different_grades" do
      subject.add("Henry", 3)
      subject.add("Lizzy", 4)
      expect(subject.students(3)).to eq(["Henry"])
      expect(subject.students(4)).to eq(["Lizzy"])
    end

    it "test_grade_with_multiple_students" do
      grade = 5

      students = %w(Ayo Blessing Desmond)
      students.each { |student| subject.add(student, grade) }
      expect(subject.students(grade)).to eq(students)
    end

    it "test_grade_with_multiple_students_sorts_correctly" do
      grade = 5
      students = %w(Desmond Ayo Blessing)
      students.each { |student| subject.add(student, grade) }
      expected_result = students.sort
      expect(subject.students(grade)).to eq(expected_result)
    end
  end
  context "grade" do
    it "test_empty_students_by_grade" do
      expected_result = []
      expect(subject.students_by_grade).to eq(expected_result)
    end
    it "test_students_by_grade_sorted" do
      everyone.each do |enrollment|
        enrollment[:students].each { |student| subject.add(student, enrollment[:grade]) }
      end
      expected_result = everyone_sorted
      expect(subject.students_by_grade).to eq(expected_result)
    end
  end

  def everyone
    [
      { grade: 3, students: %w(Damian Robert Mary) },
      { grade: 1, students: %w(Joe Amanda Onyinye) },
      { grade: 2, students: %w(Vivian Mike Nkem) },
    ]
  end

  def everyone_sorted
    [
      { grade: 1, students: %w(Amanda Joe Onyinye) },
      { grade: 2, students: %w(Mike Nkem Vivian) },
      { grade: 3, students: %w(Damian Mary Robert) },
    ]
  end
end
