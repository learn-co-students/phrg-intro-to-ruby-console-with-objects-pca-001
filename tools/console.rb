# frozen_string_literal: true

require_relative '../config/environment.rb'

# Gradually uncomment the code below to check
# that your API is working correctly.

geometry = Course.new("Geometry")
euro_history = Course.new("European History")
poetry = Course.new("Poetry 101")

raise "Course.all did not return collection of instances of Course" unless Course.all.is_a?(Array) && Course.all.first.is_a?(Course)

raise "Course.find_by_subject(subject) did not return an instance of Course" unless Course.find_by_subject("European History").is_a?(Course)
raise "Course.find_by_subject(subject) did not return the correct course" unless Course.find_by_subject("Poetry 101") == poetry

amy = Student.new("Amy", "Schumer")
jim = Student.new("Jim", "Carrey")
ed = Student.new("Eddie", "Murhpy")

raise "Student.all did not return collection of instances of Course" unless Student.all.is_a?(Array) && Student.all.first.is_a?(Student)

raise "Student#full_name did not return a string" unless jim.full_name.is_a?(String)
raise "Student#full_name did not return the first and last name of the student" unless jim.full_name == "Jim Carrey" && amy.full_name == "Amy Schumer"

semester1 = "Fall 2019"
semester2 = "Spring 2020"

enrollment1 = jim.enroll(geometry, semester1)
enrollment2 = jim.enroll(poetry, semester2)
enrollment3 = ed.enroll(euro_history, semester1)
enrollment4 = amy.enroll(euro_history, semester2)
enrollment5 = amy.enroll(geometry, semester1)

raise "Student#enroll(course, semester) did not return an instance of Enrollment" unless enrollment1.is_a?(Enrollment) && enrollment3.is_a?(Enrollment)

raise "Enrollment.all did not return an array of enrollment objects" unless Enrollment.all.is_a?(Array) && Enrollment.all.first.is_a?(Enrollment)

raise "Enrollment#semester did not return an instance of String" unless enrollment4.semester.is_a?(String)
raise "Enrollment#semester did not return the correct semester" unless enrollment3.semester == semester1 && enrollment4.semester == semester2 && enrollment5.semester == semester1

raise "Enrollment#course did not return an instance of Course" unless enrollment2.course.is_a?(Course)
raise "Enrollment#course did not return the correct course" unless enrollment1.course == geometry && enrollment3.course == euro_history && enrollment2.course == poetry

raise "Enrollment#student did not return an instance of Student" unless enrollment2.student.is_a?(Student)
raise "Enrollment#student did not return the correct student" unless enrollment1.student == jim && enrollment3.student == ed && enrollment5.student == amy

raise "Course#enrollments did not return an array" unless poetry.enrollments.is_a?(Array)
raise "Course#enrollments did not return an collection of Enrollment objects" unless poetry.enrollments.first.is_a?(Enrollment)
raise "Course#enrollments did not return the correct collection of Enrollment objects" unless poetry.enrollments.include?(enrollment2) && !poetry.enrollments.include?(enrollment1) && !poetry.enrollments.include?(enrollment4) && geometry.enrollments.include?(enrollment5) && !geometry.enrollments.include?(enrollment3)

raise "Course#class_list did not return an array" unless geometry.class_list.is_a?(Array)
raise "Course#class_list did not return an collection of student full_names" unless geometry.class_list.include?("Amy Schumer")
raise "Course#class_list did not return the correct collection of Students" unless geometry.class_list.include?("Amy Schumer") && geometry.class_list.include?("Jim Carrey") && !geometry.class_list.include?("Eddie Murphy")

school_supply1 = amy.buy_supply("Pencil")
school_supply2 = amy.buy_supply("Pen")
school_supply3 = ed.buy_supply("Binder")
school_supply4 = ed.buy_supply("Laptop")
school_supply5 = jim.buy_supply("Pen")
school_supply6 = ed.buy_supply("Text Book")

raise "Student#buy_supply(kind) did not return an instance of SchoolSupply" unless school_supply4.is_a?(SchoolSupply)

raise "SchoolSupply.all did not return a collection of instances of SchoolSupplies" unless SchoolSupply.all.is_a?(Array) && SchoolSupply.all.first.is_a?(SchoolSupply)

raise "SchoolSupply#student did not return an instance of Student" unless school_supply5.student.is_a?(Student)
raise "SchoolSupply#student did not return the correct instance of student (Hint: How was this supply created in Student#buy_supply(kind)?)" unless school_supply5.student == jim && school_supply6.student == ed && school_supply2.student == amy

raise "Student#school_supplies did not return a collection of instances of SchoolSupplies" unless amy.school_supplies.is_a?(Array) && jim.school_supplies.first.is_a?(SchoolSupply)
raise "Student#school_supplies did not the correct school_supplies" unless amy.school_supplies.include?(school_supply2) && !amy.school_supplies.include?(school_supply3) && ed.school_supplies.include?(school_supply4) && !ed.school_supplies.include?(school_supply5)

raise "SchoolSupply.find_all_by_kind(kind) did not return a collection of SchoolSupply instances" unless SchoolSupply.find_all_by_kind("Pencil").is_a?(Array) && SchoolSupply.find_all_by_kind("Pencil").first.is_a?(SchoolSupply)
raise "SchoolSupply.find_all_by_kind(kind) did not return the correct collection of school_supplies" unless SchoolSupply.find_all_by_kind("Text Book").first == school_supply6 && SchoolSupply.find_all_by_kind("Pen").length == 2 && SchoolSupply.find_all_by_kind("Pen").include?(school_supply5) && SchoolSupply.find_all_by_kind("Pen").include?(school_supply2)

Course.new("Basic Math")
Course.new("European History")
Course.new("Ruby")

raise "Course.all_subjects should return a collection" unless Course.all_subjects.is_a?(Array)
raise "Course.all_subjects should return a collection of course subjects" unless Course.all_subjects.include?("Geometry") && Course.all_subjects.include?("European History") && Course.all_subjects.include?("Ruby")
raise "Course.all_subjects should not return duplicate subjects" unless Course.all_subjects.uniq == Course.all_subjects


