# frozen_string_literal: true

class HandicapDifferential
  attr_reader :round
  delegate :esc_score, :rating, :slope, to: :round

  def self.calculate(round)
    new(round).calculate
  end

  def initialize(round)
    @round = round
  end

  def calculate
    (((esc_score - rating) * 113) / slope).round(1)
  end
end
