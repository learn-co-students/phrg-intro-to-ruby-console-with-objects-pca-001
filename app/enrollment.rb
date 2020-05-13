# frozen_string_literal: true

class Enrollment
  attr_reader :student, :course, :semester

  @@all = []

  def initialize(student, course, semester)
    @student = student
    @course = course
    @semester = semester
    @@all << self
  end

  def self.all
    @@all
  end
end
