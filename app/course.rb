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
    all.find { |course| course.subject == subject }
  end

  def enrollments
    Enrollment.all.select { |item| item.course == self }
  end

  def class_list
    enrollments.map { |item| item.student.full_name }
  end

  def self.all_subjects
    all.collect(&:subject).uniq
  end
end
