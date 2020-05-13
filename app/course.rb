# frozen_string_literal: true

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
    Enrollment.all.select do |item|
      item.course == self
    end
  end

  def class_list
    enrollments.map do |item|
      item.student.full_name
    end
  end

  def self.all_subjects
    all.map(&:subject).uniq
  end

end
