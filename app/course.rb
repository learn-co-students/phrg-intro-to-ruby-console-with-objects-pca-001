# frozen_string_literal: true
require 'pry'

class Course
  attr_accessor :subject
  @@all = []

  def initialize(subject)
    @subject = subject
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
    enrollments.map do |enroll|
      enroll.student.full_name
    end
  end

  def self.all_subjects
    all.map do |course|
      course.subject
    end.uniq
  end
end

