# frozen_string_literal: true

class Enrollment

  attr_accessor :student, :course, :semester

  @@all = []

  def initialize(student, course, semester)
    @course = course
    @student = student
    @semester = semester
    @@all << self
  end

  def self.all
    @@all
  end

end
