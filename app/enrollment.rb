# frozen_string_literal: true

class Enrollment
  attr_accessor :course, :student, :semester

  @@all = []

  def initialize(course, student, semester)
    @course = course
    @student = student
    @semester = semester
    @@all << self
  end

  def self.all
    @@all
  end

end
