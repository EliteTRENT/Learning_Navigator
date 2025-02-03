class Student < ApplicationRecord
  has_many :enrollments
  has_many :subjects, through: :enrollments
  has_many :registrations
  has_many :exams, through: :registrations
end
