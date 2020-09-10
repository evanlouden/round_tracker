# frozen_string_literal: true

class User < ApplicationRecord
  has_many :rounds, -> { order(date: :desc) }

  validates :name, presence: true

  def handicap
    Handicap.calculate(rounds.order(date: :desc).limit(1).first, include_round: true)
  end
end
