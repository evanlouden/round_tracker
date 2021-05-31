# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :date, presence: true
  validates :rating, presence: true
  validates :score, presence: true
  validates :slope, presence: true

  scope :filter_by_course_id, ->(course_id) { where course_id: course_id}

  def handicap_differential
    HandicapDifferential.calculate(self)
  end
end
