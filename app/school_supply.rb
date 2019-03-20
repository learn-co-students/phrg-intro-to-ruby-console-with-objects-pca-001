# frozen_string_literal: true

class SchoolSupply
  attr_accessor :student, :kind

  def initialize(student, kind)
    @kind = kind
    @student = student
  end
end
