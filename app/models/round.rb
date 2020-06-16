# frozen_string_literal: true

class Round < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :score, presence: true
  validates :rating, presence: true
  validates :slope, presence: true

  def handicap_differential
    HandicapDifferential.new(rating: rating, score: score, slope: slope).calculate
  end
end
