# frozen_string_literal: true
require 'pry'

class Course

  attr_accessor :subject, :enrollments, :course

  @@all = []

  def initialize(subject)
    @subject = subject
    @enrollments = enrollments
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_subject(subject)
    all.find do |course|
      course.subject == subject
    end
  end

  def enrollments
    Enrollment.all.select do |enrollment|
      enrollment.course == self
    end
  end

  def class_list
    enrollments.map do |enrollment|
      enrollment.student.full_name
    end
  end

  def self.all_subjects
    all.map do |course|
      course.subject
    # returns a collection of all the subjects of all courses, without duplications
    end.uniq
  end
end
