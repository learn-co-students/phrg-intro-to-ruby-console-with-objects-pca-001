# frozen_string_literal: true

class SchoolSupply
  attr_accessor :student, :kind

  @@all = []


  def initialize(student, kind)
    @kind = kind
    @student = student
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_all_by_kind(kind)
    @@all.select { |school_supply| school_supply.kind == kind}
  end
end
