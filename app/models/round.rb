# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :date, presence: true
  validates :rating, presence: true, if: :eighteen_holes?
  validates :score, presence: true
  validates :slope, presence: true, if: :eighteen_holes?

  scope :filter_by_course_id, ->(course_id) { where course_id: course_id}

  def self.full
    where(holes: 18)
  end

  def handicap_differential
    HandicapDifferential.calculate(self)
  end

  def eighteen_holes?
    holes == 18
  end
end
