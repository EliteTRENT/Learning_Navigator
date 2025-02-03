class Registration < ApplicationRecord
  belongs_to :student
  belongs_to :exam

  validate :student_must_be_enrolled_in_subject

  private

  def student_must_be_enrolled_in_subject
    unless student.subjects.include?(exam.subject)
      errors.add(:student, "mus t be enrolled in the subject before registering for the exam")
    end
  end
end
