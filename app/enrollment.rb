# frozen_string_literal: true

class Enrollment
  attr_accessor :course, :semester, :student
  @@all = []

  def initialize(course, semester, student)
    @course = course
    @semester = semester
    @@all << self
    @student = student
  end

  def self.all
    @@all
  end


end
