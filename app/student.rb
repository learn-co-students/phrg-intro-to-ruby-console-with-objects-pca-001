# frozen_string_literal: true

class Student
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @@all << self
  end

  def self.all
    @@all
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def enroll(course, semester)
    Enrollment.new(course, self, semester)
  end

  def buy_supply(kind)
    SchoolSupply.new(self, kind)
  end

  def school_supplies
    SchoolSupply.all.select do |item|
      item.student == self
    end
  end
end
