# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rounds
  has_many :courses, -> { distinct }, through: :rounds

  validates :name, presence: true

  def handicap
    Handicap.calculate(rounds.order(date: :desc).limit(1).first, include_round: true)
  end
end
