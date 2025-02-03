class Exam < ApplicationRecord
  belongs_to :subject
  has_many :registrations
  has_many :students, through: :registrations
end
